########################################################
## Gianluca Bellocchi <gianluca.bellocchi@unimore.it> ##
########################################################

#!/usr/bin/env python3

# Packages
from mako.template import Template
import math
import re
import sys

from templates.hw.common.hwpe_common import hwpe_common

from templates.hw.hwpe_wrapper.hwpe_streamer.modules.streaming.streaming import streaming
from templates.hw.hwpe_wrapper.hwpe_streamer.modules.fifo.fifo import fifo
from templates.hw.hwpe_wrapper.hwpe_streamer.modules.tcdm.tcdm import tcdm

# HWPE streamer
class hwpe_streamer:
    def __init__(self, specs):
        
        # Engineer(-s)
        self.author                 = specs.author
        self.email                  = specs.email

        # Environment
        self.destdir                = specs.dest_dir
        self.module                 = "hwpe_wrapper/hwpe_streamer/top/hwpe_streamer"

        # Generic
        self.hwpe_target            = specs.hwpe_target

        # HWPE streaming interfaces
        self.list_sink_stream                   = [item[0] for item in specs.list_sink_stream]
        self.list_source_stream                 = [item[0] for item in specs.list_source_stream]
        self.sink_is_parallel                   = [item[3] for item in specs.list_sink_stream]
        self.source_is_parallel                 = [item[3] for item in specs.list_source_stream]
        self.sink_parallelism_factor            = [item[4] for item in specs.list_sink_stream]
        self.source_parallelism_factor          = [item[4] for item in specs.list_source_stream]
        self.n_sink                             = specs.n_sink
        self.n_source                           = specs.n_source

         # Address generation
        self.addr_gen_in_isprogr                = [item[0] for item in specs.addr_gen_in]
        self.addr_gen_out_isprogr               = [item[0] for item in specs.addr_gen_out]

        self.specs                  = specs

        # Template
        self.template               = self.get_template()

    def gen(self):
        s = self.common(self.specs) + self.modules(self.specs) + self.template
        pulp_template = Template(s)
        string = pulp_template.render(
            author                  = self.author,
            email                   = self.email,
            target                  = self.hwpe_target, 
            n_sink                  = self.n_sink, 
            n_source                = self.n_source,
            stream_in               = self.list_sink_stream,
            stream_out              = self.list_source_stream,
            is_parallel_in          = self.sink_is_parallel,
            is_parallel_out         = self.source_is_parallel,
            in_parallelism_factor   = self.sink_parallelism_factor,
            out_parallelism_factor  = self.source_parallelism_factor,
            addr_gen_in_isprogr     = self.addr_gen_in_isprogr,
            addr_gen_out_isprogr    = self.addr_gen_out_isprogr,
        )
        s = re.sub(r'\s+$', '', string, flags=re.M)
        return s
    
    def get_template(self):
        with open('templates/hw/'+self.module+'.template_sv', 'r') as f:
            s = f.read()
            f.close()
            return s

    def common(self, specs):
        self.c                      = hwpe_common(specs).gen()
        return self.c

    def modules(self, specs):
        self.m                      = ''
        self.m                      += fifo(specs).gen()
        self.m                      += streaming(specs).gen()
        self.m                      += tcdm(specs).gen()
        return self.m

