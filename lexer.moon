howl.aux.lpeg_lexer ->
  c = capture
  ident = (alpha + '_')^1 * (alpha + digit + '_')^0
  ws = blank^0

  identifier = c 'identifier', ident

  keyword = c 'keyword', word {
    'break', 'continue', 'castto', 'const', 'default', 'elif', 'else', 'export',
    'extern', 'for', 'generic', 'goto', 'if', 'in', 'match', 'pkg', 'protect',
    'sizeof', 'struct', 'trait', 'type', 'union', 'use', 'var', 'while'
  }

  type = c 'type', any {
    word {
      'void', 'bool', 'char', 'int8', 'int16', 'int32', 'int64', 'uint8',
      'uint16', 'uint32', 'uint64', 'int', 'uint', 'long', 'ulong', 'float32',
      'float64', 'byte'
    }
    '@' * (ident + '.')^1
  }

  special = c 'special', any {
    '`' * (ident + '.')^1
    word { 'true', 'false' }
  }

  string = c 'string', span '"', '"', '\\'

  typedef = c('keyword', word {'type', 'pkg'}) * blank^1 * c 'type_def', ident
  fdecl = c('fdecl', ident) * ws * c('operator', '=') * ws * c 'operator', '{'

  char = span "'", "'", '\\'
  number = c 'number', any {
    float
    hexadecimal_float
    hexadecimal
    char
    digit * (digit + '_')^0
  }

  operator = c 'operator', S':,=()[]{}.!;+-*/%^#&|~<>'

  comment = c 'comment', span '/*', '*/'

  any {
    string
    number
    comment
    typedef
    fdecl
    keyword
    type
    special
    identifier
    operator
  }
