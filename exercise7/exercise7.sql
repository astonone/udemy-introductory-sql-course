-- step 1
select id, name
from music_instrument
where id = 1;

-- step 2
select parent.id,
       parent.name,
       child.id   as child_id,
       child.name as child_name
from music_instrument as parent
         left join music_instrument as child on child.parent_id = parent.id
where parent.id = 1;

-- step 3
select parent.id,
       parent.name,
       child.id         as child_id,
       child.name       as child_name,
       grand_child.id   as grandchild_id,
       grand_child.name as grandchild_name
from music_instrument as parent
         left join music_instrument as child on child.parent_id = parent.id
         left join music_instrument as grand_child on grand_child.parent_id = child.id
where parent.id = 1
order by name, child_name, grandchild_name;

-- step 4
select parent.id,
       parent.name,
       child.id         as child_id,
       child.name       as child_name,
       grand_child.id   as grandchild_id,
       grand_child.name as grandchild_name,
       level4.id        as level4_id,
       level4.name      as level4_name,
       level5.id        as level5_id,
       level5.name      as level5_name,
       level6.id        as level6_id,
       level6.name      as level6_name,
       level7.id        as level7_id,
       level7.name      as level7_name,
       level8.id        as level8_id,
       level8.name      as level8_name,
       level9.id        as level9_id,
       level9.name      as level9_name
from music_instrument as parent
         left join music_instrument as child on child.parent_id = parent.id
         left join music_instrument as grand_child on grand_child.parent_id = child.id
         left join music_instrument as level4 on level4.parent_id = grand_child.id
         left join music_instrument as level5 on level5.parent_id = level4.id
         left join music_instrument as level6 on level6.parent_id = level5.id
         left join music_instrument as level7 on level7.parent_id = level6.id
         left join music_instrument as level8 on level8.parent_id = level7.id
         left join music_instrument as level9 on level9.parent_id = level8.id
where parent.id = 1
order by name, child_name, grandchild_name, level4_name, level5_name, level6_name, level7_name, level8_name, level9_name;
