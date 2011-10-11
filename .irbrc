require 'wirble'

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT][:MY_PROMPT] = {
  :PROMPT_I => "%03n:>> ",
  :PROMPT_N => "%03n:%i> ",
  :PROMPT_S => "%03n:>%l ",
  :PROMPT_C => "%03n:>> ",
  :RETURN => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :MY_PROMPT

Wirble.init
Wirble.colorize
