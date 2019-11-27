RED='\033[0;31m'
NC='\033[0m' # No Color
VERSION="2_2"
if [[ $PWD == *"WARPFIELD_Installer"* ]]; then
    echo -e "${RED}!!!! WARNING !!!!${NC}"
    echo -e "${RED} WARNING: You are in the WARPFIELD_Installer directory${NC}"
    echo -e "Do not install WARPFIELD packages here."
    echo -e "Go to the directory where you will install warpfield packes, and rerun this script"
else
    git clone https://github.com/EricPell/warpfield_core
    git clone https://github.com/EricPell/warpfield_emp
    git clone https://github.com/EricPell/warpfield_emp_viewer
    pip3 install -I pyqt5, astropy

    echo "export WARPFIELD_CORE=$PWD/warpfield_core/" > ~/.warpfield_init.sh
    echo "export WARPFIELD_EMP_DEBUG=False" >> ~/.warpfield_init.sh
    echo "export WARPFIELD_EMP_DEFAULT_TABLE=$WARPFIELD_CORE/public_data/cloud_data/warpfield_emp_1d_v1.0.ecsv" >> ~/.warpfield_init.sh
    echo "export PYTHONPATH=\$PYTHONPATH:$PWD" >> ~/.warpfield_init.sh
    echo "alias warpfield_gui=\"python3 $PWD/warpfield_emp_viewer/WARPEMP_VIEWER_v${VERSION}.py\"" >> ~/.warpfield_init.sh

    echo -e "\n#The following line was added by the WARPFIELD Installer script" >> ~/.bashrc
    echo -e "source ~/.warpfield_init.sh\n" >> ~/.bashrc
fi