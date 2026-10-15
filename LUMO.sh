#!/bin/bash

echo " --- Linux User Management Operations ---"
echo
echo " 1. Create a new user"
echo " 2. Delete an existing user"
echo " 3. Modify user information"
echo " 4. Set or change user password"
echo " 5. Lock a user account"
echo " 6. Unlock a user account"
echo " 7. Display user information"
echo " 8. Dsplay the groups to which a user belongs"
echo " 9. Display all system users"
echo "10. Check whether user exists"
echo "11. Display currently logged-in users"
echo "12. Change a user's login shell"
echo "13. Change a user's home directory"
echo "14. Set account expiration date"
echo "15. Display account aging information"
echo "16. Remove a user along with their home directory"
echo "17. Exit"
echo
read -p "Enter choice to perform operation : " choice
echo
	  if [ "$EUID" -ne 0 ]; then
          echo "Please run this script with sudo or as root."
          exit 1
          fi
echo
case "$choice" in
	1)
	 read -p "Enter the username you want to create : " NEW_USER
	 if [[ -z $NEW_USER ]]; then
	 echo "Username cannot be blank."
	 exit 1
	 fi
	 echo
	 echo "Creating User $NEW_USER"
	 echo
	 adduser $NEW_USER
	 echo
	 echo "User $NEW_USER created successfully!"
	;;

      2)
	read -p "Enter the username to delete : " TARGET_USER

	if ! id "$TARGET_USER" &>/dev/null; then
	echo "User '$TARGET_USER' does not exists."
	exit 1
	fi
	echo
	echo "You are about to permanently delete  '$TARGET_USER'."
	echo
	read -p "Are you absolutely sure? (y/N): " CONFIRM
	echo
	if [[ $CONFIRM  =~ ^[Yy]$ ]]; then
	echo "Deleting user '$TARGET_USER' and removing their home directory."
	if command -v deluser &> /dev/null; then
	  deluser --remove-home "$TARGET_USER"
	fi
	echo
	echo "Success! User '$TARGET_USER' has been completely removed."
	else
	echo
	echo "Operation Failed>"
	fi
	;;

      3)
        read -p "Enter the username you want to modify: " TARGET_USER
	if ! id "$TARGET_USER" &> /dev/null; then
	echo "User '$TARGET_USER' does not exists."
	exit 1
	fi
	echo
	echo "--------------------------------------------------"
	echo "What detail would you like to modify for $TARGET_USER?"
	echo "1) Name (Description)"
	echo "2) Login username"
	echo "3) Add to a new group"
	echo "4) Change home directory"
	echo "--------------------------------------------------"
	echo
	read -p "Select an option (1-4): " OPTION
	echo
	case $OPTION in
		1)
		  read  -p  "Enter new Name: " NEW_NAME
		  usermod -c "$NEW_NAME" "$TARGET_USER"
		  echo "Name updated to: $NEW_NAME"
		  ;;

		2)
		  read -p   "Enter NEW login username: " NEW_LOGIN
		  if [[ "$NEW_LOGIN" == *" "* ]]; then
		  echo "Username cannot contain spaces"
		  exit 1
		  fi

		 usermod -l "$NEW_LOGIN" "$TARGET_USER"
		 echo "Username changed from '$TARGET_USER' to '$NEW_LOGIN'"
	         ;;

	       3)
		 read -p "Enter group name to add them to: " GROUP_NAME
		 if ! getent group "$GROUP_NAME" &>/dev/null; then
		 echo "Group '$GROUP_NAME' does not exists."
		 fi
		 echo

		 usermod -aG "$GROUP_NAME" "$TARGET_USER"
		 echo "Added $TARGET_USER to group name : $GROUP_NAME"
                 ;;

	      4)
		 read -p "Enter new home directory absolute path : " NEW_DIR
		 usermod -d "$NEW_DIR" -m "$TARGET_USER"
		 echo "Home directory moved to : $NEW_DIR"
		 ;;

	*)
	  echo "Invalid Option Selected."
	  exit 1
	  ;;
       esac
       ;;

    4)
      read -p "Enter username to change their password : " TARGET_USER
      passwd $TARGET_USER 
      ;;
    
    5)
      read -p "Enter username to lock user : " TARGET_USER
      usermod -L $TARGET_USER
      usermod -e 1 $TARGET_USER
      ;;

    6)
      read -p "Enter username to Unlock user : " TARGET_USER
      passwd -u $TARGET_USER
      usermod -e -1 $TARGET_USER 
      ;;

    7)
      read  -p "Enter username to display user information : " TARGET_USER
      id $TARGET_USER
      getent passwd $TARGET_USER
      id -nG $TARGET_USER
      ;;

    8)
      read -p "Enter username to display the groups to which a user belongs : " TARGET_USER
      id -nG $TARGET_USER
      ;;

    9)
      getent passwd
      ;;

   10)
      read -p "Enter username to check it is exists or not : " TARGET_USER
      if id $TARGET_USERR &> /dev/null; then
         echo "$TARGET_USER Exists"
      else
	echo "$TARGET_USER Not exists"
     fi
      ;;

   11)
      who
      ;;
   12)
      
      ;;

*)
  echo "Enter Valid Choice"
  exit 1
  ;;
esac




