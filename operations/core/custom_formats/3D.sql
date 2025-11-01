INSERT INTO custom_formats (name, description)
VALUES (
    '3D',
    'Matches the 3D Regex Pattern'
);

-- Add condition for REMUX pattern
INSERT INTO custom_format_conditions (custom_format_id, name, type, arr_type, negate, required)
VALUES (
    (SELECT id FROM custom_formats WHERE name = '3D'),
    'Release Title Contains 3D',
    'release_title',
    'all',
    0,
    1
);

-- Link condition to regex
INSERT INTO condition_patterns (custom_format_condition_id, regular_expression_id)
VALUES (
    (SELECT id FROM custom_format_conditions WHERE name = 'Release Title Contains 3D'),
    (SELECT id FROM regular_expressions WHERE name = '3D')
);

-- Add tags
INSERT OR IGNORE INTO tags (name) VALUES ('archival'), ('lossless');

INSERT INTO custom_format_tags (custom_format_id, tag_id)
VALUES 
    ((SELECT id FROM custom_formats WHERE name = '3D'), (SELECT id FROM tags WHERE name = 'archival')),
    ((SELECT id FROM custom_formats WHERE name = '3D'), (SELECT id FROM tags WHERE name = 'lossless'));