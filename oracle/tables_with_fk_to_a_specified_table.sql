SELECT     src_cc.owner     AS src_owner,
        src_cc.table_name   AS src_table,
        src_cc.column_name  AS src_column,
        dest_cc.owner       AS dest_owner,
        dest_cc.table_name  AS dest_table,
        dest_cc.column_name AS dest_column,
        c.constraint_name
    FROM all_constraints c
    INNER JOIN all_cons_columns dest_cc
    ON  c.r_constraint_name = dest_cc.constraint_name
    AND c.r_owner           = dest_cc.owner
    INNER JOIN all_cons_columns src_cc
    ON  c.constraint_name   = src_cc.constraint_name
    AND c.owner             = src_cc.owner
    WHERE c.constraint_type = 'R'
    AND dest_cc.owner       = 'WM6'
    AND dest_cc.table_name  = 'ORDER_HEADER'
        --and dest_cc.column_name = 'MY_OPTIONNAL_TARGET_COLUMN'