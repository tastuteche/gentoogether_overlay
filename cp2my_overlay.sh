#!/r/a/p/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

ebfile=$(equery which $1)

if [ $? -eq 0 ]
then
  echo "Successfully found file:$ebfile"
else
  echo "Could not find  file" >&2
  exit 1
fi

if [[ "$ebfile" =~ "/r/a/p/usr/local/portage/" ]]; then
    echo "!!!already in local overlay"
    ebuild $ebfile digest
echo "###ebuild $ebfile install"
echo "###emerge $1"
echo "###emerge =$1"
    exit 1
else
    echo "main file found:$ebfile"
fi
if [[ "$ebfile" =~ "/r/a/p/var/lib/layman/libressl/" ]]; then
    echo "!!!layman/libressl"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/libressl/@/usr/local/portage/@')
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/kde/" ]]; then
    echo "!!!layman/kde"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/kde/@/usr/local/portage/@')  
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/gnome/" ]]; then
    echo "!!!layman/gnome"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/gnome/@/usr/local/portage/@')   
elif [[ "$ebfile" =~ "/r/a/p/usr/portage/" ]]; then
    echo "!!! gentoo::prefix"
    local_ebfile=$(echo $ebfile|sed -e 's@/usr/portage/@/usr/local/portage/@')
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/torbrowser/" ]]; then
    echo "!!!layman/torbrowser"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/torbrowser/@/usr/local/portage/@') 
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/twister/" ]]; then
    echo "!!!layman/twister"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/twister/@/usr/local/portage/@') 
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/gmt-heroxbd-rap-overlay/" ]]; then
    echo "!!!layman/gmt-heroxbd-rap-overlay"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/gmt-heroxbd-rap-overlay/@/usr/local/portage/@')  
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/heroxbd/" ]]; then
    echo "!!!layman/heroxbd"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/heroxbd/@/usr/local/portage/@')  
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/gentoo/" ]]; then
    echo "!!!layman/gentoo"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/gentoo/@/usr/local/portage/@')  
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/sabayon/" ]]; then
    echo "!!!layman/sabayon"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/sabayon/@/usr/local/portage/@')  
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/sabayon-distro/" ]]; then
    echo "!!!layman/sabayon-distro"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/sabayon-distro/@/usr/local/portage/@')  
elif [[ "$ebfile" =~ "/r/a/p/var/lib/layman/bitcoin/" ]]; then
    echo "!!!layman/bitcoin"
    local_ebfile=$(echo $ebfile|sed -e 's@/var/lib/layman/bitcoin/@/usr/local/portage/@')  
else
    echo "!!! unknown layman"
    exit 1
fi



local_dir=${local_ebfile%/*}
echo $local_dir

if [ ! -d "$local_dir" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
    mkdir -p $local_dir
else
     echo "!!!local folder already exists:$local_dir"
fi

if [ ! -f "$local_ebfile" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
	echo "coping to:$local_ebfile"
    cp $ebfile $local_ebfile
    ebuild $local_ebfile digest
else
     echo "!!!local file already exists:$local_ebfile"
fi

main_dir=${ebfile%/*}
echo $main_dir

if [  -d "$main_dir/files" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
    if [ ! -d "$local_dir/files" ]; then
        # Control will enter here if $DIRECTORY doesn't exist.
        cp -r "$main_dir/files" "$local_dir/files"
        pushd "$local_dir"
        repoman manifest
        popd
    else
         echo "!!!local files folder already exists:$local_dir/files"
    fi
else
     echo "!!!main files folder not  exists:$main_dir/files"
fi
echo "@@@ebuild $local_ebfile install"
echo "###emerge $1"
echo "###emerge =$1"
