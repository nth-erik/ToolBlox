# ToolBlox

*ToolBlox* is a QuakeC framework built from the ground up with clarity and integrity at its forefront.

With a highly factorized feature set and robust patterns based on industry standards, *ToolBlox* aims to establish a streamlined modding experience with a relatively low barrier of entry, and accessible in-code documentation to provide a balanced learning curve even for non-coders in order to free our creativity from the burdens of Quake's 1996 release-time tech debt.

It's important to note that ToolBlox stands on the shoulders of giants, originally deriving from an earlier version (2.0) of the phenomenal [progs_dump](https://github.com/progs-dump-dev/progs_dump) mod, and it pays dedicated respect to everyone mentioned in the original codebase.

Key features:

- In-code documentation (similar to JSDoc/JavaDoc)
- Standardized naming convention – e.g.: `myMod_MyFunction`, `myMod_myVar`, `MYMOD_MYCONSTANT`
- Shielded properties via fail-safe accessors – i.e.: `tbx_Get*`, `tbx_Set*`, `tbx_Add*`, `tbx_Scale*`
- Optimized functions with accessible getters – e.g.: `tbx_GetTraceSolidFlags`
- Active use of [SRP](https://en.wikipedia.org/wiki/Single_responsibility_principle) and [OCP](https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle)
- Well-structured codebase
- Legacy core functions with deprecation warning included

## How to Start

***ToolBlox* is in early development, and it lacks basic entity definitions, which will be radically different from the original *Quake* entities to adhere to modern design principles.**

1. Download *ToolBlox* using *Git* or as a *Zip* archive using the green `<Code>` dropdown button at the top
2. Extract the contents into `<your-quake-folder>/<your-mod-folder>/src`
3. Download and configure your preferred QuakeC compiler – e.g. [FTEQCC](https://www.fteqcc.org/)
4. Build the project from your `src` folder
5. Run Quake with `-game <your-mod-folder>` argument, or select your mod from the in-game menu, if your [source port](https://www.slipseer.com/index.php?threads/quake-engines-source-ports-a-beginners-guide.11/) supports that (for reasonable backwards compatibility, QuakeSpasm or FTE are advisable)
6. Open your favorite IDE or code editor for Quake C – e.g. [Visual Studio Code](https://code.visualstudio.com/) or [FTEQCCGUI](https://www.fteqcc.org/)
7. Take a look at `tbx_callbacks.qc` and explore the folder structure
8. ~~Get the official *ToolBlox Quake* map pack~~
9. ~~Start a new game~~
10. Wait patiently for an official ToolBlox Quake map pack :sweat_smile: