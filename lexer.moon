howl.aux.lpeg_lexer ->
  c = capture
  ident = (alpha + '_')^1 * (alpha + digit + '_')^0

  identifier = c 'identifier', ident

  keyword = c 'keyword', word {
    'castto', 'match', 'const', 'default', 'elif', 'else', 'export', 'extern',
    'for', 'generic', 'goto', 'if', 'pkg', 'protect', 'sizeof', 'struct',
    'trait', 'type', 'union', 'use', 'var', 'while'
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
    keyword
    type
    special
    identifier
    operator
  }
