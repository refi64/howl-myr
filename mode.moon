{
  lexer: bundle_load 'lexer'

  comment_syntax: { '/*', '*/' }

  auto_pairs:
    '(': ')'
    '[': ']'
    '{': '}'
    '"': '"'
    "'": "'"

  indentation:
    more_after: {
      r'(if|elif|else|for|while|match|struct|union)\\b',
      r'pkg\\b.*=$'
      ':$'
      r'=\\s*{[^}]*$',
    }
    less_for: {r'}|;;$'}

  code_blocks:
    multiline: {
      {r'(if|elif|else|for|while|match|struct|union)\\b', '^%s*;;$', ';;'}
      {r'=\\s*{[^}]*$', '^%s*}', '}'}
    }
}
