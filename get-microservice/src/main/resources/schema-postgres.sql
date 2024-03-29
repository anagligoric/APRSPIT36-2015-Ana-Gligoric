
drop table if exists nationality CASCADE;
drop table if exists league CASCADE;
drop table if exists team CASCADE;
drop table if exists player CASCADE;
DROP SEQUENCE IF EXISTS nationality_seq CASCADE;
DROP SEQUENCE IF EXISTS team_seq CASCADE;
DROP SEQUENCE IF EXISTS league_seq CASCADE;
DROP SEQUENCE IF EXISTS player_seq CASCADE;
create table nationality (
	id integer not null,
    nationality_name varchar(100) not null,
    abbreviation varchar(50) not null
);

create table league (
	id integer not null,
    league_name varchar(100) not null,
    label varchar(50)
);

create table team(
	id integer not null ,
	team_name varchar(100) not null,
  founded date not null,
	headquarter varchar(100) not null,
	league_id integer not null
);

create table player(
	 id integer not null,
	num integer not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    reg_number varchar(50) not null,
    date_of_birth date not null,
	 height integer not null,
    nationality_id integer not null,
    team_id integer not null
);

alter table nationality add constraint pk_nationality primary key(id);
alter table league add constraint pk_league primary key(id);
alter table team add constraint pk_team primary key(id);
alter table player add constraint pk_player primary key(id);

alter table team add constraint fk_team_league foreign key(league_id) references league(id);
alter table player add constraint fk_player_team foreign key(team_id) references team(id);
alter table player add constraint fk_player_nationality foreign key(nationality_id) references nationality(id);

create index idxpk_nationality on nationality(id);
create index idxpk_league on league(id);
create index idxpk_team on team(id);
create index idxpk_player on player(id);

create index idxfk_team_league on team(league_id);
create index idxfk_player_team on player(team_id);
create index idxfk_player_nationality on player(nationality_id);


CREATE SEQUENCE nationality_seq
INCREMENT 1;
CREATE SEQUENCE team_seq
INCREMENT 1;
CREATE SEQUENCE league_seq
INCREMENT 1;
CREATE SEQUENCE player_seq
INCREMENT 1;