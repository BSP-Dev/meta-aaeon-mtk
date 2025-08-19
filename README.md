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
|uCOM-IMX8P| 2G/4G|

### Build uCOM-IMX8P BSP
- (1)	Download Yocto BSP with kernel 6.6.36 RT
    ```bash!
    $ mkdir imx-yocto-bsp
    $ cd imx-yocto-bsp
    $ repo init -u https://github.com/BSP-Dev/aaeon-manifest.git -b scarthgap -m aaeon-scarthgap-v03.xml
    $ repo sync
    ```
- (2)	Environment setup
    ```bash!
    # uCOM-IMX8P (2G DDR)
    $ DISTRO=nxp-real-time-edge MACHINE=imx-ucom-imx8p-2g source esa-setup-env.sh -b build-imx8mpevk-real-time-edge
	
	# uCOM-IMX8P (4G DDR)
    $ DISTRO=nxp-real-time-edge MACHINE=imx-ucom-imx8p-4g source esa-setup-env.sh -b build-imx8mpevk-real-time-edge
    
    ```
    
- (3)	Build NXP IMX BSP
    ```bash!
    $ bitbake nxp-image-real-time-edge
    ```
- Note: (1)	If FetchError,then change git branch=master => branch=main

