use v6;

# This role class has common command parts.
role RecommenderWorkflows::Grammar::CommonParts {

  # Speech parts
  token do-verb { 'do' }
  token with-preposition { 'using' | 'with' | 'by' }
  token using-preposition { 'using' | 'with' | 'over' }
  token by-preposition { 'by' | 'with' | 'using' }
  token for-preposition { 'for' | 'with' }
  token of-preposition { 'of' }
  token from-preposition { 'from' }
  token to-preposition { 'to' | 'into' }
  token assign { 'assign' | 'set' }
  token a-determiner { 'a' | 'an'}
  token and-conjuction { 'and' }
  token the-determiner { 'the' }
  rule for-which-phrase { 'for' 'which' | 'that' 'adhere' 'to' }
  rule number-of { [ 'number' | 'count' ] 'of' }
  token per { 'per' }
  token results { 'results' }
  token simple { 'simple' | 'direct' }
  token use-verb { 'use' | 'utilize' }
  token get-verb { 'obtain' | 'get' | 'take' }
  token object { 'object' }
  token system { 'system' }

  # Data
  rule records { 'rows' | 'records' }
  rule time-series-data { 'time' 'series' [ 'data' ]? }
  rule data-frame { 'data' 'frame' }
  token dataset { 'dataset' }
  rule data { <data-frame> | 'data' | <dataset> | <time-series-data> }
  token dataset-name { ([ \w | '_' | '-' | '.' | \d ]+) <!{ $0 eq 'and' }> }
  token variable-name { ([ \w | '_' | '-' | '.' | \d ]+) <!{ $0 eq 'and' }> }

  # Directives
  rule load-data-directive { ( 'load' | 'ingest' ) <.the-determiner>? <data> }
  token create-directive { 'create' | 'make' }
  token generate-directive { 'generate' | 'create' | 'make' }
  token compute-directive { 'compute' | 'find' | 'calculate' }
  token display-directive { 'display' | 'show' | 'echo' }
  rule compute-and-display { <compute-directive> [ 'and' <display-directive> ]? }
  token diagram { 'plot' | 'plots' | 'graph' | 'chart' }
  rule plot-directive { 'plot' | 'chart' | <display-directive> <diagram> }
  rule use-directive { [ <get-verb> <and-conjuction>? ]? <use-verb> }
  token classify { 'classify' }

  # Value types
  token number-value { (\d+ ['.' \d+]?  [ [e|E] \d+]?) }
  token integer-value { \d+ }
  token percent { '%' | 'percent' }
  token percent-value { <number-value> <.percent> }
  token boolean-value { 'True' | 'False' | 'true' | 'false' }

  # Lists of things
  token list-separator-symbol { ',' | '&' | 'and' }
  token list-separator { <.ws>? <list-separator-symbol> <.ws>? }
  token list { 'list' }

  # Variables list
  rule variable-names-list { <variable-name>+ % <list-separator> }

  # Number list
  rule number-value-list { <number-value>+ % <list-separator> }

  # Range
  rule range-spec-step { <with-preposition> | <with-preposition>? 'step' }
  rule range-spec { [ <.from-preposition> <number-value> ] [ <.to-preposition> <number-value> ] [ <.range-spec-step> <number-value> ]? }

}