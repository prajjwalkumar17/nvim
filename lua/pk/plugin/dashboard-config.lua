local setup, db= pcall(require, "dashboard")
if not setup then
  return
end


db.setup({
  theme = 'doom',
  config = {
      header = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[            ▄▄▄▄▄▄▄▄▄            ]],
      [[           ▄█████████████▄          ]],
      [[   █████  █████████████████  █████  ]],
      [[   ▐████▌ ▀███▄       ▄███▀ ▐████▌  ]],
      [[    █████▄  ▀███▄   ▄███▀  ▄█████    ]],
      [[    ▐██▀███▄  ▀███▄███▀  ▄███▀██▌    ]],
      [[     ███▄▀███▄  ▀███▀  ▄███▀▄███    ]],
      [[     ▐█▄▀█▄▀███ ▄ ▀ ▄ ███▀▄█▀▄█▌    ]],
      [[      ███▄▀█▄██ ██▄██ ██▄█▀▄███      ]],
      [[       ▀███▄▀██ █████ ██▀▄███▀      ]],
      [[      █▄ ▀█████ █████ █████▀ ▄█      ]],
      [[      ███        ███        ███      ]],
      [[      ███▄    ▄█ ███ █▄    ▄███      ]],
      [[      █████ ▄███ ███ ███▄ █████      ]],
      [[      █████ ████ ███ ████ █████      ]],
      [[      █████ ████▄▄▄▄▄████ █████      ]],
      [[       ▀███ █████████████ ███▀      ]],
      [[         ▀█ ███ ▄▄▄▄▄ ███ █▀        ]],
      [[            ▀█▌▐█████▌▐█▀            ]],
      [[               ███████              ]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
    },
        center = {
            {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'a',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Search Text           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'Telescope live_grep'
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Recent Files           ',
        desc_hl = 'String',
        key = 'c',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'Telescope oldfiles'
      },
        {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Config           ',
        desc_hl = 'String',
        key = 'd',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'edit  ~/.config/nvim/lua/pk/plugin-setup.lua'
      }
    },
    footer = {
      [[]],
      [[]],
      [[]],
      [[]],
      'Well this can be hurting!!!'}

  }
})
