module path

import os

const slash = os.path_separator

fn test_empty() {
	out := extname('')
	assert out == ''
}

fn test_name() {
	out := extname('a')
	assert out == ''
}

fn test_ext() {
	out := extname('.a')
	assert out == ''
}

fn test_name_with_dot() {
	out := extname('a.')
	assert out == '.'
}

fn test_name_with_dot_and_slash() {
	out := extname('a.${slash}')
	assert out == '.'
}

fn test_name_with_ext() {
	out := extname('a.b')
	assert out == '.b'
}

fn test_name_with_ext_and_slash() {
	out := extname('a.b${slash}')
	assert out == '.b'
}

fn test_name_with_ext_and_two_slashes() {
	out := extname('a.b${slash}${slash}')
	assert out == '.b'
}

fn test_slash_before_dot() {
	out := extname('${slash}.a')
	assert out == ''
}
