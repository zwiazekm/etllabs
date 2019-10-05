create function VMConfigVal(@x xml, @path varchar(max))
returns nvarchar(max)
as
begin
    declare @ret nvarchar(max)

    ;with cte as
    (
    select  value = x.c.value('.', 'varchar(50)')
    ,       path = cast ( null as varchar(max) )
    ,       node = x.c.query('.')
    from    @x.nodes('/*') x(c)
    union all
    select  n.c.value('.', 'varchar(50)')
    ,       isnull( c.path + '/', '/' )
        +       n.c.value('local-name(.)', 'varchar(max)')
    ,       n.c.query('*')
    from    cte c
    cross   apply c.node.nodes('*') n(c)
    )
    select @ret = value from cte where path = @path
    return @ret
    end