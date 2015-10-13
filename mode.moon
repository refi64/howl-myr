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
    more_after: {r'{$', r'(if|for|while|match|struct|union)\\b', r'pkg\\b.*=$'}
    less_for: {r'}|;;$'}

  code_blocks:
    multiline: {
      {r'{$', '^%s*}', '}'}
      {r'(if|for|while|match|struct|union)\\b', '^%s*;;$', ';;'}
    }
}
