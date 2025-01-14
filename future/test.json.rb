#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./caps_lock.json.rb
#

require 'json'
require_relative '../lib/karabiner.rb'

def main
  puts JSON.pretty_generate(
    'title' => 'Change caps_lock key (rev 4)',
    'rules' => [
      {
        'description' => 'Change caps_lock key to command+control+option+shift if pressed with other keys',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'key_code' => 'caps_lock',
              'modifiers' => Karabiner.from_modifiers(nil, ['any']),
            },
            'to' => [
              {
                'key_code' => 'left_shift',
                'modifiers' => %w[
                  left_command left_control left_option
                ],
              },
            ],
            'to_if_alone' => [
              {
                'hold_down_milliseconds' => 100,
                'key_code' => 'caps_lock',
              },
            ],
          },
        ],
      },
      {
        'description' => 'Change caps_lock key to command+control+option+shift. (Post escape key when pressed alone)',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'key_code' => 'caps_lock',
              'modifiers' => Karabiner.from_modifiers(nil, ['any']),
            },
            'to' => [
              {
                'key_code' => 'left_shift',
                'modifiers' => %w[
                  left_command left_control left_option
                ],
              },
            ],
            'to_if_alone' => [
              {
                'key_code' => 'escape',
              },
            ],
          },
        ],
      },
      {
        'description' => 'Change caps_lock key to command+control+option+shift. (Post f19 key when pressed alone)',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'key_code' => 'caps_lock',
              'modifiers' => Karabiner.from_modifiers(nil, ['any']),
            },
            'to' => [
              {
                'key_code' => 'left_shift',
                'modifiers' => %w[
                  left_command left_control left_option
                ],
              },
            ],
            'to_if_alone' => [
              {
                'key_code' => 'f19',
              },
            ],
          },
        ],
      },
      {
        'description' => 'Change caps_lock key to command+control+option+shift. (Use shift+caps_lock as caps_lock)',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'key_code' => 'caps_lock',
              'modifiers' => Karabiner.from_modifiers(['shift'], ['caps_lock']),
            },
            'to' => [
              {
                'key_code' => 'caps_lock',
              },
            ],
          },
          {
            'type' => 'basic',
            'from' => {
              'key_code' => 'caps_lock',
              'modifiers' => Karabiner.from_modifiers(nil, ['any']),
            },
            'to' => [
              {
                'key_code' => 'left_shift',
                'modifiers' => %w[
                  left_command left_control left_option
                ],
              },
            ],
          },
        ],
      },
      {
        'description' => 'Change caps_lock to control if pressed with other keys, to escape if pressed alone.',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'key_code' => 'caps_lock',
              'modifiers' => Karabiner.from_modifiers(nil, ['any']),
            },
            'to' => [
              {
                'key_code' => 'left_control',
              },
            ],
            'to_if_alone' => [
              {
                'key_code' => 'escape',
              },
            ],
          },
        ],
      },
      {
        'description' => 'Change caps_lock to control if pressed with other keys. (rev 2)',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'key_code' => 'caps_lock',
              'modifiers' => Karabiner.from_modifiers(nil, ['any']),
            },
            'to' => [
              {
                'key_code' => 'left_control',
              },
            ],
            'to_if_alone' => [
              {
                'key_code' => 'caps_lock',
                'hold_down_milliseconds' => 500,
              },
            ],
          },
        ],
      },
      {
        'description' => 'Disable caps_lock delay (rev 1)',
        'manipulators' => [
          {
            'type' => 'basic',
            'from' => {
              'key_code' => 'caps_lock',
              'modifiers' => Karabiner.from_modifiers(nil, ['any']),
            },
            'to' => [
              {
                'key_code' => 'caps_lock',
                'hold_down_milliseconds' => 200,
              },
              # Put vk_none in order to ensure both caps_lock key_down and key_up events are fired at physical key down.
              {
                'key_code' => 'vk_none',
              },
            ],
          },
        ],
      },
    ]
  )
end

main