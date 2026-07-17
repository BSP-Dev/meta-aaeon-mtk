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
- Your Build Host must install required packages for the Yocto build. Reference to the section "Build Host Packages" in the document "Yocto Project Quick build".
    - [Build-Host-Packages](https://docs.yoctoproject.org/5.0.3/brief-yoctoprojectqs/index.html#build-host-packages)

## Download the Yocto Project BSP
```plaintext
mkdir <release> && cd <release>
repo init -u https://github.com/BSP-Dev/aaeon-manifest.git -b <branch name> [ -m <release manifest>]
repo sync
```
- Each branch has detailed READMEs describing exact syntax.

- Please see the corresponding sections below for details.

### Support Devices

| Machine  | DDR  |
| -------- | ---- |
|uCOM-M510 |  8G  |
|uCOM-M700 |  8G  |

### Build MTK BSP
- (1)	Download Yocto BSP with kernel 6.6
    ```bash!
    $ mkdir imx-yocto-bsp
    $ cd imx-yocto-bsp
    $ export PROJ_ROOT=`pwd`
    $ repo init -u git@github.com:BSP-Dev/aaeon-manifest.git -b scarthgap -m aaeon-scarthgap-v05.xml --no-repo-verify
    $ repo sync
    ```
- (2)	Environment setup
    ```bash!
    $ source aaeon-mtk-setup-release.sh
	$ export TEMPLATECONF=$PROJ_ROOT/src/meta-rity/meta/conf/templates/default/
    $ source src/poky/oe-init-build-env ucom-mtk-build
	$ export BUILD_DIR=`pwd`
    ```
    Additional environment setup (Optional):
    ```bash!
    # Setup with NDA Repository
    $ echo 'NDA_BUILD = "1"' >> $BUILD_DIR/conf/site.conf
    ```
    
- (3)	Build BSP
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

