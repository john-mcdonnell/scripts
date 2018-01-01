#!/bin/sh

setScriptFilename() {
	FILE_NAME=$0

	# Check if the file is a symbolic link.
	if [ -L "$FILE_NAME" ]; then
		FILE_NAME=$(readlink "$FILE_NAME");
	fi
	SCRIPT_FILE=`basename $FILE_NAME`
	RESULT=$?
	if [ $RESULT -ne 0 ]; then
		echo "ERR: $RESULT: Error encountered while determining the name of the current script."
		return $RESULT;
	fi

	return 0
}

setScriptFolderName() {
	FILE_NAME=$0

	# Check if the file is a symbolic link.
	if [ -L "$FILE_NAME" ]; then
		FILE_NAME=$(readlink "$FILE_NAME");
	fi
	SCRIPT_FOLDER=`dirname $FILE_NAME`;
	RESULT=$?
	if [ $RESULT -ne 0 ]; then
		echo "ERR: $RESULT: Error encountered while determining the name of the folder containing the current script."
		return $RESULT;
	fi

	if [ "$SCRIPT_FOLDER" = "" ] || [ "$SCRIPT_FOLDER" = "." ] || [ -z "$SCRIPT_FOLDER" ]; then
		SCRIPT_FOLDER=`pwd`
	fi

    if [ "$(echo $SCRIPT_FOLDER | head -c 1)" != "/" ]; then
        SCRIPT_FOLDER=`pwd`/$SCRIPT_FOLDER
    fi

	return 0
}

initialiseEnvironmentVariables() {
    if [ ! -z "$ENVIRONMENT_VALIABLE_SYSTEM_WIDE_FILENAME" ]; then
        if [ -f $ENVIRONMENT_VALIABLE_SYSTEM_WIDE_FILENAME ]; then
            . $ENVIRONMENT_VALIABLE_SYSTEM_WIDE_FILENAME
            RESULT=$?
            if [ $RESULT -ne 0 ]; then
                return $RESULT
            fi
        fi
    fi

	return 0
}

initialiseEnvironment() {
    initialiseEnvironmentVariables
    RESULT=$?
    if [ $RESULT -ne 0 ]; then
        return $RESULT
    fi

	setScriptFilename
	RESULT=$?
	if [ $RESULT -ne 0 ]; then
		return $RESULT
	fi

	setScriptFolderName
	RESULT=$?
	if [ $RESULT -ne 0 ]; then
		return $RESULT
	fi

	return 0
}

finalise() {
    initialiseEnvironmentVariables
    RESULT=$?
    if [ $RESULT -ne 0 ]; then
        return $RESULT
    fi

    return 0
}

main() {
	initialiseEnvironment
	RESULT=$?
	if [ $RESULT -ne 0 ]; then
		return $RESULT
	fi

	return 0
}

main
RESULT=$?
if [ $RESULT -ne 0 ]; then
	return $RESULT
fi

FOLDER_NAME=$1
FILE_FILTER=$2
if [ "$FILE_FILTER" = "" ]; then
	FILE_FILTER=".*"
fi
BACKUP_FOLDER=~/.backup
ARCHIVE_FILENAME=$BACKUP_FOLDER/`basename $FOLDER_NAME`-`date "+%Y-%m-%d_%H-%M-%S"`.tar.gz
UTILITY_CREATE_FOLDER=$SCRIPT_FOLDER/create-folder.sh
ARCHIVE_UTILITY="tar -cvpzf"

echo SCRIPT_FILE:$SCRIPT_FILE.
echo SCRIPT_FOLDER:$SCRIPT_FOLDER.
echo FOLDER_NAME:$FOLDER_NAME.
echo BACKUP_FOLDER:$BACKUP_FOLDER.
echo ARCHIVE_FILENAME:$ARCHIVE_FILENAME.
echo UTILITY_CREATE_FOLDER:$UTILITY_CREATE_FOLDER.
echo ARCHIVE_UTILITY:$ARCHIVE_UTILITY.

echo
echo
echo

"$UTILITY_CREATE_FOLDER" "$BACKUP_FOLDER"

#$ARCHIVE_UTILITY "$ARCHIVE_FILENAME" "$FOLDER_NAME"
find "$FOLDER_NAME" -type f -regex "$FILE_FILTER" | $ARCHIVE_UTILITY "$ARCHIVE_FILENAME" -T -

finalise
