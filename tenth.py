ostack = []
open_chars = ['(', '[', '{', '<']
close_chars = [')', ']', '}', '>']
scoring_map = {
    ')': 3,
    ']': 57,
    '}': 1197,
    '>': 25137
}

auto_complete_scoring_map = {
    '(': 1,
    '[': 2,
    '{': 3,
    '<': 4
}

corruption_score = 0
auto_complete_scores = []

with open('tenth_input.txt') as file:
    for line in file:
        corrupted = False
        for c in line:
            if c == '\n': continue
            if c in open_chars:
                ostack.append(c)
            elif len(ostack) > 0 and close_chars.index(c) == open_chars.index(ostack[-1]):
                # we have a match
                ostack.pop()
            else:
                # We are corrupted
                corruption_score += scoring_map[c]
                corrupted = True
                break

        if not corrupted:
            # Calculate auto completion score
            tmp_score = 0
            idx = len(ostack) - 1
            while idx >= 0:
                tmp_score *= 5
                tmp_score += auto_complete_scoring_map[ostack[idx]]
                idx -= 1
            auto_complete_scores.append(tmp_score)

        ostack = []
print('Part one: ' + str(corruption_score))

auto_complete_scores.sort()
print('Part two: ' + str(auto_complete_scores[(len(auto_complete_scores)-1)/2]))
