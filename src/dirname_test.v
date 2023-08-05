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
	out := dirname('${path.slash}')
	assert out == '${path.slash}'
}

fn test_two_slashes() {
	out := dirname('${path.slash}${path.slash}')
	assert out == '${path.slash}'
}

fn test_name_ends_with_slash() {
	out := dirname('a${path.slash}')
	assert out == '.'
}

fn test_name_ends_with_two_slashes() {
	out := dirname('a${path.slash}${path.slash}')
	assert out == '.'
}

fn test_name_starts_with_slash() {
	out := dirname('${path.slash}a')
	assert out == '${path.slash}'
}

fn test_name_starts_with_two_slashes() {
	out := dirname('${path.slash}${path.slash}a')
	assert out == '${path.slash}'
}

fn test_names_with_slash() {
	out := dirname('a${path.slash}b')
	assert out == 'a'
}
