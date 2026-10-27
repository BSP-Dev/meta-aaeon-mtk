# AAEON MTK Manifest README
- This repo is dedicated to the MTK modules. Here you can find the Yocto BSP recipes for AAEON.
- You can follow the same steps to build your own customized BSP based on your interests.
## Install the `repo` utility:
- To use this manifest repo, the `repo` tool must be installed first.
```bash
mkdir ~/bin
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo  > ~/bin/repo
chmod a+x ~/bin/repo
PATH=${PATH}:~/bin
```
## Install essential host packages
- Please ensure you have setup the build environment on a Linux host computer before continuing with this guide.
    - [Build-Host-Environment](https://genio.mediatek.com/doc/iot-yocto/latest/sw/yocto/get-started/env-setup/build-env-linux.html)

## Create the Yocto Project
### Support Devices

| Machine  | DDR  |
| -------- | ---- |
|uCOM-M510 |  8G  |
|uCOM-M700 |  8G  |

### Download the Recipes
- (1)	Download Yocto BSP with kernel 6.6 (Based on MediaTek IoT Yocto version v26.0)
    ```bash!
    $ mkdir imx-yocto-bsp
    $ cd imx-yocto-bsp
    $ export PROJ_ROOT=`pwd`
    $ repo init -u git@github.com:BSP-Dev/aaeon-manifest.git -b scarthgap -m aaeon-mtk-scarthgap-v260.xml
    $ repo sync
    ```
- (2)	Configure Build Environment
    ```bash!
    $ export TEMPLATECONF=$PROJ_ROOT/src/meta-aaeon-mtk/conf/templates/default/
    $ source src/poky/oe-init-build-env ucom-mtk-build
	$ export BUILD_DIR=`pwd`
    ```
    - Initially, the build directory structure should look like this:
        ```bash!
        $BUILD_DIR
            └── conf
                    ├── bblayers.conf
                    ├── local.conf
                    └── templateconf.cfg
        ```
    - By default the IoT Yocto will be built only with packages that are publicly available on Internet. To build IoT Yocto with MediaTek proprietary packages, access to private repositories under MediaTek Git01 service is required.
        ```bash!
        $ echo 'NDA_BUILD = "1"' >> $BUILD_DIR/conf/site.conf
        ```
    - If you have already built IoT Yocto before, you might notice there are two folders `downloads` and `sstate-cache` created during the build process. ([Reference](https://genio.mediatek.com/doc/iot-yocto/latest/sw/yocto/get-started/build-code.html#setup-dl-dir-and-sstate-dir)):
        ```bash!
        $ echo 'DL_DIR = "${TOPDIR}/../downloads"' >> $BUILD_DIR/conf/site.conf
        $ echo 'SSTATE_DIR = "${TOPDIR}/../sstate-cache"' >> $BUILD_DIR/conf/site.conf
        ```
- (3)	Fetch and Build the Packages
    #### uCOM-M510 (8G DDR)
	```bash!
    $ export MACHINE=mtk-ucom-m510
    $ bitbake rity-demo-image -k
    ```
	#### uCOM-M700 (8G DDR)
	```bash!
    $ export MACHINE=mtk-ucom-m700
    $ bitbake rity-demo-image -k
    ```
- Note: (1)	If FetchError,then change git branch=master => branch=main

## Documentations:

* [MTK BSP documentation](https://mediatek.gitlab.io/aiot/rity/meta-mediatek-bsp)
* [RITY documentation](https://mediatek.gitlab.io/aiot/rity/meta-rity)
* [AIoT tools documentation](https://mediatek.gitlab.io/aiot/bsp/aiot-tools)
