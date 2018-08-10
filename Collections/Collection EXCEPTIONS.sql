DECLARE
    TYPE NumList IS TABLE OF NUMBER;
    nums NumList;
BEGIN
    nums(1) := 1; -- raises COLLECTION_IS_NULL
    nums := NumList(1, 2);
    nums(NULL) := 3; -- raises VALUE_ERROR
    nums(0) := 3; -- raises SUBSCRIPT_BEYOND_COUNT
    nums(3) := 3; --raises SUBSCRIPT_OUTSIDE_LIMIT
    nums.Delete(1);
    IF nums(1) = 1 THEN ... -- raises NO_DATA_FOUND
END;
