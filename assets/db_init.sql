CREATE TABLE t_User(
	id					TEXT NOT NULL PRIMARY KEY
	,[name]				TEXT NOT NULL
    ,[fullname]			TEXT
    ,[about]			TEXT
	,email				TEXT
	,birthDate			TEXT NOT NULL
    ,registrateDate		TEXT NOT NULL
	,avatarLink			TEXT
);
CREATE TABLE t_Post(
	id					TEXT NOT NULL PRIMARY KEY
	,[description]		TEXT
	,userId			    TEXT NOT NULL
    ,createdDate		TEXT NOT NULL
	,FOREIGN KEY(userId) REFERENCES t_User(id)
);
CREATE TABLE t_PostContent(
	id					TEXT NOT NULL PRIMARY KEY
	,[name]				TEXT
	,mimeType			TEXT
	,postId				TEXT
    ,contentLink		TEXT
	,FOREIGN KEY(postId) REFERENCES t_Post(id)
);