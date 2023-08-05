module path

import os

const sep = os.path_separator[0]

pub fn basename(p string) string {
	if p.len < 2 {
		return p
	}

	end := last_name_end(p)
	sep_index := last_sep(p, end)

	return if sep_index > 0 {
		p[sep_index + 1..end]
	} else if sep_index == 0 {
		if sep_index + 1 == end {
			p[0..1]
		} else {
			p[sep_index + 1..end]
		}
	} else if end < p.len {
		p[..end]
	} else {
		p
	}
}

pub fn dirname(p string) string {
	if p.len == 0 {
		return '.'
	}
	if p.len == 1 && p[0] == path.sep {
		return p
	}

	end := last_name_end(p)
	sep_index := last_sep(p, end)

	return if sep_index > 0 {
		p[..sep_index]
	} else if sep_index == 0 {
		p[0..1]
	} else {
		'.'
	}
}

pub fn extname(p string) string {
	if p.len < 2 {
		return ''
	}

	end := last_name_end(p)
	mut dot_index := last_index_of(p, `.`, end)
	return if dot_index > 0 {
		if dot_index > 0 {
			prev := p[dot_index - 1]
			if prev == path.sep {
				''
			} else {
				p[dot_index..end]
			}
		} else {
			p[dot_index..end]
		}
	} else {
		''
	}
}

[direct_array_access]
fn last_name_end(p string) int {
	mut end := p.len
	for end > 1 {
		c := p[end - 1]
		if c != path.sep {
			break
		}
		end--
	}
	return end
}

[direct_array_access]
fn last_sep(s string, end int) int {
	for i := end - 1; i >= 0; i-- {
		c := unsafe { s.str[i] }
		if c == path.sep {
			return i
		}
	}
	return -1
}

[direct_array_access]
fn last_index_of(s string, c u8, end int) int {
	for i := end - 1; i >= 0; i-- {
		if unsafe { s.str[i] == c } {
			return i
		}
	}
	return -1
}
