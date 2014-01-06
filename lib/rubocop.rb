# encoding: utf-8

require 'rainbow'
require 'English'
require 'set'
require 'parser/current'
require 'ast/sexp'
require 'powerpack'

require 'rubocop/version'

require 'rubocop/cop/util'
require 'rubocop/cop/offence'
require 'rubocop/cop/cop'
require 'rubocop/cop/commissioner'
require 'rubocop/cop/corrector'
require 'rubocop/cop/team'

require 'rubocop/cop/variable_inspector'
require 'rubocop/cop/variable_inspector/locatable'
require 'rubocop/cop/variable_inspector/variable'
require 'rubocop/cop/variable_inspector/assignment'
require 'rubocop/cop/variable_inspector/reference'
require 'rubocop/cop/variable_inspector/scope'
require 'rubocop/cop/variable_inspector/variable_table'

require 'rubocop/cop/mixin/array_syntax'
require 'rubocop/cop/mixin/autocorrect_alignment'
require 'rubocop/cop/mixin/check_assignment'
require 'rubocop/cop/mixin/check_methods'
require 'rubocop/cop/mixin/configurable_max'
require 'rubocop/cop/mixin/code_length'
require 'rubocop/cop/mixin/configurable_enforced_style'
require 'rubocop/cop/mixin/configurable_naming'
require 'rubocop/cop/mixin/if_node'
require 'rubocop/cop/mixin/if_then_else'
require 'rubocop/cop/mixin/negative_conditional'
require 'rubocop/cop/mixin/parser_diagnostic'
require 'rubocop/cop/mixin/safe_assignment'
require 'rubocop/cop/mixin/surrounding_space'
require 'rubocop/cop/mixin/space_inside'
require 'rubocop/cop/mixin/space_after_punctuation'
require 'rubocop/cop/mixin/statement_modifier'
require 'rubocop/cop/mixin/string_help'

require 'rubocop/cop/lint/ambiguous_operator'
require 'rubocop/cop/lint/ambiguous_regexp_literal'
require 'rubocop/cop/lint/assignment_in_condition'
require 'rubocop/cop/lint/block_alignment'
require 'rubocop/cop/lint/condition_position'
require 'rubocop/cop/lint/debugger'
require 'rubocop/cop/lint/else_layout'
require 'rubocop/cop/lint/empty_ensure'
require 'rubocop/cop/lint/end_alignment'
require 'rubocop/cop/lint/end_in_method'
require 'rubocop/cop/lint/ensure_return'
require 'rubocop/cop/lint/eval'
require 'rubocop/cop/lint/handle_exceptions'
require 'rubocop/cop/lint/invalid_character_literal'
require 'rubocop/cop/lint/literal_in_condition'
require 'rubocop/cop/lint/loop'
require 'rubocop/cop/lint/parentheses_as_grouped_expression'
require 'rubocop/cop/lint/rescue_exception'
require 'rubocop/cop/lint/shadowing_outer_local_variable'
require 'rubocop/cop/lint/syntax'
require 'rubocop/cop/lint/unreachable_code'
require 'rubocop/cop/lint/useless_assignment'
require 'rubocop/cop/lint/useless_comparison'
require 'rubocop/cop/lint/useless_else_without_rescue'
require 'rubocop/cop/lint/useless_setter_call'
require 'rubocop/cop/lint/void'

require 'rubocop/cop/style/access_modifier_indentation'
require 'rubocop/cop/style/accessor_method_name'
require 'rubocop/cop/style/alias'
require 'rubocop/cop/style/align_array'
require 'rubocop/cop/style/align_hash'
require 'rubocop/cop/style/align_parameters'
require 'rubocop/cop/style/and_or'
require 'rubocop/cop/style/ascii_comments'
require 'rubocop/cop/style/ascii_identifiers'
require 'rubocop/cop/style/attr'
require 'rubocop/cop/style/begin_block'
require 'rubocop/cop/style/block_comments'
require 'rubocop/cop/style/block_nesting'
require 'rubocop/cop/style/blocks'
require 'rubocop/cop/style/case_equality'
require 'rubocop/cop/style/case_indentation'
require 'rubocop/cop/style/character_literal'
require 'rubocop/cop/style/class_and_module_camel_case'
require 'rubocop/cop/style/class_length'
require 'rubocop/cop/style/class_methods'
require 'rubocop/cop/style/class_vars'
require 'rubocop/cop/style/collection_methods'
require 'rubocop/cop/style/colon_method_call'
require 'rubocop/cop/style/comment_annotation'
require 'rubocop/cop/style/constant_name'
require 'rubocop/cop/style/cyclomatic_complexity'
require 'rubocop/cop/style/def_parentheses'
require 'rubocop/cop/style/documentation'
require 'rubocop/cop/style/dot_position'
require 'rubocop/cop/style/empty_line_between_defs'
require 'rubocop/cop/style/empty_lines'
require 'rubocop/cop/style/empty_lines_around_body'
require 'rubocop/cop/style/empty_lines_around_access_modifier'
require 'rubocop/cop/style/empty_literal'
require 'rubocop/cop/style/encoding'
require 'rubocop/cop/style/end_block'
require 'rubocop/cop/style/end_of_line'
require 'rubocop/cop/style/even_odd'
require 'rubocop/cop/style/favor_join'
require 'rubocop/cop/style/favor_sprintf'
require 'rubocop/cop/style/favor_unless_over_negated_if'
require 'rubocop/cop/style/favor_until_over_negated_while'
require 'rubocop/cop/style/final_newline'
require 'rubocop/cop/style/flip_flop'
require 'rubocop/cop/style/for'
require 'rubocop/cop/style/global_vars'
require 'rubocop/cop/style/hash_methods'
require 'rubocop/cop/style/hash_syntax'
require 'rubocop/cop/style/if_unless_modifier'
require 'rubocop/cop/style/if_with_semicolon'
require 'rubocop/cop/style/indentation_width'
require 'rubocop/cop/style/lambda'
require 'rubocop/cop/style/lambda_call'
require 'rubocop/cop/style/leading_comment_space'
require 'rubocop/cop/style/line_length'
require 'rubocop/cop/style/method_def_parentheses'
require 'rubocop/cop/style/method_call_parentheses'
require 'rubocop/cop/style/method_called_on_do_end_block'
require 'rubocop/cop/style/method_length'
require 'rubocop/cop/style/method_name'
require 'rubocop/cop/style/module_function'
require 'rubocop/cop/style/multiline_block_chain'
require 'rubocop/cop/style/multiline_if_then'
require 'rubocop/cop/style/nil_comparison'
require 'rubocop/cop/style/not'
require 'rubocop/cop/style/numeric_literals'
require 'rubocop/cop/style/one_line_conditional'
require 'rubocop/cop/style/op_method'
require 'rubocop/cop/style/parameter_lists'
require 'rubocop/cop/style/parentheses_around_condition'
require 'rubocop/cop/style/perl_backrefs'
require 'rubocop/cop/style/predicate_name'
require 'rubocop/cop/style/proc'
require 'rubocop/cop/style/raise_args'
require 'rubocop/cop/style/redundant_begin'
require 'rubocop/cop/style/redundant_exception'
require 'rubocop/cop/style/redundant_return'
require 'rubocop/cop/style/redundant_self'
require 'rubocop/cop/style/regexp_literal'
require 'rubocop/cop/style/rescue_modifier'
require 'rubocop/cop/style/semicolon'
require 'rubocop/cop/style/signal_exception'
require 'rubocop/cop/style/single_line_block_params'
require 'rubocop/cop/style/single_line_methods'
require 'rubocop/cop/style/space_after_colon'
require 'rubocop/cop/style/space_after_comma'
require 'rubocop/cop/style/space_after_control_keyword'
require 'rubocop/cop/style/space_after_method_name'
require 'rubocop/cop/style/space_after_not'
require 'rubocop/cop/style/space_after_semicolon'
require 'rubocop/cop/style/space_around_block_braces'
require 'rubocop/cop/style/space_around_equals_in_parameter_default'
require 'rubocop/cop/style/space_around_operators'
require 'rubocop/cop/style/space_before_modifier_keyword'
require 'rubocop/cop/style/space_inside_hash_literal_braces'
require 'rubocop/cop/style/space_inside_brackets'
require 'rubocop/cop/style/space_inside_parens'
require 'rubocop/cop/style/special_global_vars'
require 'rubocop/cop/style/string_literals'
require 'rubocop/cop/style/symbol_array'
require 'rubocop/cop/style/tab'
require 'rubocop/cop/style/ternary_operator'
require 'rubocop/cop/style/trailing_blank_lines'
require 'rubocop/cop/style/trailing_whitespace'
require 'rubocop/cop/style/trivial_accessors'
require 'rubocop/cop/style/unless_else'
require 'rubocop/cop/style/variable_interpolation'
require 'rubocop/cop/style/variable_name'
require 'rubocop/cop/style/when_then'
require 'rubocop/cop/style/while_until_do'
require 'rubocop/cop/style/while_until_modifier'
require 'rubocop/cop/style/word_array'
require 'rubocop/cop/style/braces_around_hash_parameters'

require 'rubocop/cop/rails/default_scope'
require 'rubocop/cop/rails/has_and_belongs_to_many'
require 'rubocop/cop/rails/output'
require 'rubocop/cop/rails/read_attribute'
require 'rubocop/cop/rails/validation'

require 'rubocop/formatter/base_formatter'
require 'rubocop/formatter/simple_text_formatter'
require 'rubocop/formatter/disabled_config_formatter'
require 'rubocop/formatter/emacs_style_formatter'
require 'rubocop/formatter/clang_style_formatter'
require 'rubocop/formatter/progress_formatter'
require 'rubocop/formatter/json_formatter'
require 'rubocop/formatter/file_list_formatter'
require 'rubocop/formatter/offence_count_formatter'
require 'rubocop/formatter/formatter_set'

require 'rubocop/config'
require 'rubocop/config_loader'
require 'rubocop/config_store'
require 'rubocop/target_finder'
require 'rubocop/token'
require 'rubocop/processed_source'
require 'rubocop/source_parser'
require 'rubocop/file_inspector'
require 'rubocop/cli'
require 'rubocop/options'
