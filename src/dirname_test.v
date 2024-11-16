module path

import os

const slash = os.path_separator

fn test_empty() {
	out := dirname('')
	assert out == '.'
}

fn test_name() {
	out := dirname('a')
	assert out == '.'
}

fn test_slash() {
	out := dirname('${slash}')
	assert out == '${slash}'
}

fn test_two_slashes() {
	out := dirname('${slash}${slash}')
	assert out == '${slash}'
}

fn test_name_ends_with_slash() {
	out := dirname('a${slash}')
	assert out == '.'
}

fn test_name_ends_with_two_slashes() {
	out := dirname('a${slash}${slash}')
	assert out == '.'
}

fn test_name_starts_with_slash() {
	out := dirname('${slash}a')
	assert out == '${slash}'
}

fn test_name_starts_with_two_slashes() {
	out := dirname('${slash}${slash}a')
	assert out == '${slash}'
}

fn test_names_with_slash() {
	out := dirname('a${slash}b')
	assert out == 'a'
}
