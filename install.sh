RED='\033[0;31m'
NC='\033[0m' # No Color
VERSION="2_2"

if [[ ${PWD} == *"WARPFIELD_Installer"* ]]; then
    echo "Moving out of installer directory..."
    cd $PWD/../
fi

pip3 install -I pyqt5 astropy

echo "Setting WARPFIELD_CORE path..."
echo "export WARPFIELD_CORE=${PWD}/warpfield_core/" > $HOME/.warpfield_init.sh
export WARPFIELD_CORE=${PWD}/warpfield_core

echo "Setting WARPFIELD_EMP_DEBUG=False..."
echo "export WARPFIELD_EMP_DEBUG=False" >> $HOME/.warpfield_init.sh
export WARPFIELD_EMP_DEBUG=False

echo "Setting WARPFIELD_EMP_DEFAULT_TABLE..."
echo "export WARPFIELD_EMP_DEFAULT_TABLE=${PWD}/warpfield_core/public_data/cloud_data/warpfield_emp_1d_v1.0.ecsv" >> $HOME/.warpfield_init.sh
export WARPFIELD_EMP_DEFAULT_TABLE=${PWD}"/warpfield_core/public_data/cloud_data/warpfield_emp_1d_v1.0.ecsv"

echo "Adding WARPFIELD to PYTHONPATH"
echo "export PYTHONPATH=\$PYTHONPATH:${PWD}" >> $HOME/.warpfield_init.sh
export PYTHONPATH=\$PYTHONPATH:${PWD}

echo "creating alias"
echo "alias warpfield_gui=\"python3 ${PWD}/warpfield_emp_viewer/WARPEMP_VIEWER_v${VERSION}.py\"" >> $HOME/.warpfield_init.sh
alias warpfield_gui="python3 ${PWD}/warpfield_emp_viewer/WARPEMP_VIEWER_v${VERSION}.py"

if grep -q "source ~/.warpfield_init.sh" $HOME/.bashrc; then
    echo "Updating .warpfield_init.sh"
else
    echo -e "\n#The following line was added by the WARPFIELD Installer script" >> $HOME/.bashrc
    echo -e "source ~/.warpfield_init.sh\n" >> $HOME/.bashrc
    echo "Updating .bashrc and .warpfield_init.sh..."
fi

echo -e "${RED}\nReload the terminal to finish installation."
echo -e "${RED}Then, to run the WARPFIELD Viewer and Population synthesis GUI type:${NC} warpfield_gui\n"
