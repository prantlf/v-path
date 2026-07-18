module path

import os

const slash = os.path_separator

fn test_empty() {
	out := basename('')
	assert out == ''
}

fn test_name() {
	out := basename('a')
	assert out == 'a'
}

fn test_slash() {
	out := basename('${slash}')
	assert out == '${slash}'
}

fn test_two_slashes() {
	out := basename('${slash}${slash}')
	assert out == '${slash}'
}

fn test_name_ends_with_slash() {
	out := basename('a${slash}')
	assert out == 'a'
}

fn test_name_ends_with_two_slashes() {
	out := basename('a${slash}${slash}')
	assert out == 'a'
}

fn test_name_starts_with_slash() {
	out := basename('${slash}a')
	assert out == 'a'
}

fn test_names_with_slash() {
	out := basename('a${slash}b')
	assert out == 'b'
}
