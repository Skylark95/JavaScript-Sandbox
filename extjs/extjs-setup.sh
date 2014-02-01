EXTJS_DIR="src/main/webapp/extjs"
EXTJS_VERSION="4.2.1"
EXTJS_ZIP="ext-$EXTJS_VERSION-gpl.zip"
EXTJS_URL="http://cdn.sencha.com/ext/gpl/$EXTJS_ZIP"

BASE_DIR=$(pwd)
TARGET_DIR="target/extjs-setup"

if [ -d $EXTJS_DIR ]; then
	echo "[INFO] ExtJS library directory found"
else
	if [ ! -d $TARGET_DIR ]; then
		mkdir -p $TARGET_DIR 
	fi
	
	cd $TARGET_DIR
	
	if [ ! -e $EXTJS_ZIP ]; then
		echo "[INFO] Downloading ExtJS..."
		curl -O $EXTJS_URL
	fi
	
	echo "[INFO] Extracting ExtJS..."
	mkdir temp && cd temp 
	unzip ../$EXTJS_ZIP
	
	echo "[INFO] Moving Files..."
	mkdir $BASE_DIR/$EXTJS_DIR && mv $(ls)/* $BASE_DIR/$EXTJS_DIR
	cd .. && rm -rf temp
fi 
