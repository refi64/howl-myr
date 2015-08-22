howl.mode.register
  name: 'myrddin'
  extensions: {'myr'}
  aliases: {'myr', 'mc'}
  create: -> bundle_load 'mode'
  parent: 'curly_mode'

unload = -> howl.mode.unregister 'myrddin'

{
  info:
    author: 'Ryan Gonzalez'
    description: 'A Myrddin bundle'
    license: 'MIT'
  :unload
}
