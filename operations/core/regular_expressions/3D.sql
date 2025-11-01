INSERT INTO regular_expressions (name, pattern, regex101_id, description)
VALUES (
    '3D',
    '(?<=\b[12]\d{3}\b).*\b((bluray|bd)?3d|sbs|half[ .-]ou|half[ .-]sbs)\b',
    'wSkb7u/1',
    'Matches terms related to 3D video formats:\n- `bluray3d` or `bd3d` (optional `bluray` or `bd` followed by `3d`).\n- `sbs` (side-by-side).\n- `half ou` or `half sbs` with space (` `), dot (`.`), or hyphen (`-`) as separators.'
);