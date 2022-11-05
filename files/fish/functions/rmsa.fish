function rmsa
  reminders show Reminders;
  echo "write down reminder:";
  read reminder;
  reminders add Reminders $reminder;
end
