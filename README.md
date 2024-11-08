# <span style="font-variant:small-caps;">Richie HeSoC</span>

<figure>
  <p align="center">
  <img
  src="https://richie-docs.readthedocs.io/en/latest/_images/richie_hw.png"
  width="750px"
  </p>
</figure>

## About this project
This [**HeSoC**](https://richie-docs.readthedocs.io/en/latest/richie-platform/index.html#hardware-architecture) consists of a modular and composable architecture, including two _hardware subsystems_:

- <span style="font-variant:small-caps;">**Host**</span>—Linux-capable multi-core *application-class processor*, implementing either:

  - CVA6, a 6-stage RISC-V CPU (RV64), which is implemented on FPGA;
  - Arm Cortex-A53 CPU, a hard macro available on Zynq Ultrascale+ MPSoCs.

- <span style="font-variant:small-caps;">**Device**</span>—an *accelerator-rich subsystem*, hierarchically organized as shared-memory accelerator-rich clusters.

## About this repository
The repository is organized as follows:

- `src`: *Generated HeSoC variants*, employing the <span style="font-variant:small-caps;">Richie SLD toolchain</span>;
- `accelerators`: Collection of *application-specific accelerators*, designed employing different flows (HDL, HLS, etc.) and including both real-world use-cases and toy examples;
- `deps`: *Hardware dependencies*, including the PULP Platform IPs, components and functionalities;
- `fpga`: *FPGA* build flow, scripts and tools;
- `vsim`: *Verification setup*, including scripts to run RTL simulations using QuestaSim.

## External Sources
To pull the required Git submodules, run:
```branch
git submodule update --init --recursive
```

## Documentation
The project includes comprehensive documentation that can be accessed [online at Read the Docs](https://richie-docs.readthedocs.io/en/latest/richie-platform/index.html#hardware-architecture).

## How to contribute
We are always enthusiastic about potential collaborations and contributions to our work!
Have a look at our [contribution guide](https://richie-docs.readthedocs.io/en/latest/general/contributing.html) in order to learn how to contribute code to this repository.

## License
[Have a look at our guidelines for licensing](https://richie-docs.readthedocs.io/en/latest/general/license.html), or take a look at the full text:
- see [LICENSE-SHL](LICENSE-SHL) for the Solderpad Hardware License, Version 0.51;
- see [LICENSE-APACHE](LICENSE-APACHE) for the Apache License, Version 2.0.

## Contacts
Do not hesitate to reach us in case of questions using [our contact page](https://richie-docs.readthedocs.io/en/latest/general/team.html).
