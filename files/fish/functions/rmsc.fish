function rmsc
  reminders show Reminders;
  echo "enter number to complete:";
  read number;
  reminders complete Reminders $number;
end
