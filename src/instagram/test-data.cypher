/* create data */

CREATE (OmriWallach: User {user_id: 1, username: 'omriwallach', email: 'omriwallach1992@gmail.com', salted_password: 'salt', first_name: 'omri', last_name: 'wallach', last_ip: 'ip', date_created: '19.10.2020', date_updated: '19.10.2020'});
CREATE(OmriFirstComment: Comment {comment_id: 1, comment: 'first comment'});
CREATE(omriHashTag: HashTag {hashtag_id: 1, hashtag: 'hashtag'});
CREATE(omriLike: Like {user_id: 1, photo_id: 1, date_created: '19.10.2020', date_updated: '19.10.2020'});
CREATE(omriPhotoTag: PhotoTag {photo_id: 1, tag_id: 1});
CREATE(omriPhotoComment: PhotoTag {photo_id: 1, comment_id: 1});
CREATE(omriPhotoHashtag: PhotoHashtag {photo_id: 1, hashtag_id: 1});
CREATE(photos: Photo {photo_id: 1, user_id: 1, caption: 'caption', latitude: 1, longtitude: 1, image_path: 'path', image_size: 1,date_created: '19.10.2020', date_updated: '19.10.2020'});
CREATE(omriTag: Tag {id: 1, name: 'omri'});

/* define relationships */
MATCH (u: User), (ul:Like)
WHERE (u.user_id = 1) AND (ul.user_id = 1)
CREATE (u)-[r:USER_LIKE]->(ul);

MATCH (u: User), (p:Photo)
WHERE (u.user_id = 1) AND (p.user_id = 1)
CREATE (u)-[r:USER_PHOTO]->(p);

MATCH (c: Comment), (pt: PhotoTag)
WHERE (c.comment_id = 1) AND (pt.comment_id = 1)
CREATE (c)-[r:PHOTO_COMMENT]->(pt);

MATCH (c: Comment), (ph: PhotoHashtag)
WHERE (c.comment_id = 1) AND (ph.comment_id = 1)
CREATE (c)-[r:PHOTO_COMMENT_HASH]->(ph);

MATCH (c: Comment), (pc: PhotoComment)
WHERE (c.comment_id = 1) AND (pc.comment_id = 1)
CREATE (c)-[r:PHOTO_COMMENT_HASH]->(pc);

MATCH (p: Photo), (pc: PhotoComment)
WHERE (p.photo_id = 1) AND (pc.photo_id = 1)
CREATE (p)-[r:PHOTO_COMMENT_HASH]->(pc);

MATCH (pt: PhotoTag), (t: Tag)
WHERE (pt.tag_id = 1) AND (t.id = 1)
CREATE (pt)-[r:PHOTO_TAG]->(t);

MATCH (ht: HashTag), (pht: PhotoHashtag)
WHERE (ht.hashtag_id = 1) AND (pht.hashtag_id = 1)
CREATE (ht)-[r:HASHTAG_PHOTOHASHTAG]->(pht);

MATCH (p: Photo), (pht: PhotoHashtag)
WHERE (p.photo_id = 1) AND (pht.photo_id = 1)
CREATE (p)-[r:PHOTO_HASHTAG]->(pht);

MATCH (p: Photo), (pt: PhotoTag)
WHERE (p.photo_id = 1) AND (pt.photo_id = 1)
CREATE (p)-[r:PHOTO_PHOTOTAG]->(pt);