INSERT INTO quality_profiles (name, description, upgrades_allowed, minimum_custom_format_score, upgrade_until_score, upgrade_score_increment, language_id)
VALUES (
    'Archival 4K',
    'Perfect source preservation with lossless quality for 4K content',
    1,
    0,
    10000,
    1,
    (SELECT id FROM languages WHERE name = 'English')
);

-- Add qualities to profile (ordered by preference)
INSERT INTO quality_profile_qualities (quality_profile_id, quality_id, position, upgrade_until)
VALUES
    ((SELECT id FROM quality_profiles WHERE name = 'Archival 4K'), (SELECT id FROM qualities WHERE name = '2160p REMUX'), 1, 1),
    ((SELECT id FROM quality_profiles WHERE name = 'Archival 4K'), (SELECT id FROM qualities WHERE name = '2160p Bluray'), 2, 0),
    ((SELECT id FROM quality_profiles WHERE name = 'Archival 4K'), (SELECT id FROM qualities WHERE name = '1080p REMUX'), 3, 0);

-- Assign REMUX Quality format with high score
INSERT INTO quality_profile_custom_formats (quality_profile_id, custom_format_id, arr_type, score)
VALUES (
    (SELECT id FROM quality_profiles WHERE name = 'Archival 4K'),
    (SELECT id FROM custom_formats WHERE name = '3D'),
    'all',
    1000
);

-- Add profile tags
INSERT OR IGNORE INTO tags (name) VALUES ('4k'), ('archival');

INSERT INTO quality_profile_tags (quality_profile_id, tag_id)
VALUES
    ((SELECT id FROM quality_profiles WHERE name = 'Archival 4K'), (SELECT id FROM tags WHERE name = '4k')),
    ((SELECT id FROM quality_profiles WHERE name = 'Archival 4K'), (SELECT id FROM tags WHERE name = 'archival'));