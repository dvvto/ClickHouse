SELECT 'Const Offset';
select 1, subString(bin(toFixedString('Hello', 10)), 1), bin(bitSlice(toFixedString('Hello', 10), 1));
select 2, subString(bin(toFixedString('Hello', 10)), 2), bin(bitSlice(toFixedString('Hello', 10), 2));
select 3, subString(bin(toFixedString('Hello', 10)), 3), bin(bitSlice(toFixedString('Hello', 10), 3));
select 4, subString(bin(toFixedString('Hello', 10)), 4), bin(bitSlice(toFixedString('Hello', 10), 4));
select 5, subString(bin(toFixedString('Hello', 10)), 5), bin(bitSlice(toFixedString('Hello', 10), 5));
select 6, subString(bin(toFixedString('Hello', 10)), 6), bin(bitSlice(toFixedString('Hello', 10), 6));
select 7, subString(bin(toFixedString('Hello', 10)), 7), bin(bitSlice(toFixedString('Hello', 10), 7));
select 8, subString(bin(toFixedString('Hello', 10)), 8), bin(bitSlice(toFixedString('Hello', 10), 8));
select 9, subString(bin(toFixedString('Hello', 10)), 9), bin(bitSlice(toFixedString('Hello', 10), 9));
select 10, subString(bin(toFixedString('Hello', 10)), 10), bin(bitSlice(toFixedString('Hello', 10), 10));
select 11, subString(bin(toFixedString('Hello', 10)), 11), bin(bitSlice(toFixedString('Hello', 10), 11));
select 12, subString(bin(toFixedString('Hello', 10)), 12), bin(bitSlice(toFixedString('Hello', 10), 12));
select 13, subString(bin(toFixedString('Hello', 10)), 13), bin(bitSlice(toFixedString('Hello', 10), 13));
select 14, subString(bin(toFixedString('Hello', 10)), 14), bin(bitSlice(toFixedString('Hello', 10), 14));
select 15, subString(bin(toFixedString('Hello', 10)), 15), bin(bitSlice(toFixedString('Hello', 10), 15));
select 16, subString(bin(toFixedString('Hello', 10)), 16), bin(bitSlice(toFixedString('Hello', 10), 16));

select -1, subString(bin(toFixedString('Hello', 10)), -1), bin(bitSlice(toFixedString('Hello', 10), -1));
select -2, subString(bin(toFixedString('Hello', 10)), -2), bin(bitSlice(toFixedString('Hello', 10), -2));
select -3, subString(bin(toFixedString('Hello', 10)), -3), bin(bitSlice(toFixedString('Hello', 10), -3));
select -4, subString(bin(toFixedString('Hello', 10)), -4), bin(bitSlice(toFixedString('Hello', 10), -4));
select -5, subString(bin(toFixedString('Hello', 10)), -5), bin(bitSlice(toFixedString('Hello', 10), -5));
select -6, subString(bin(toFixedString('Hello', 10)), -6), bin(bitSlice(toFixedString('Hello', 10), -6));
select -7, subString(bin(toFixedString('Hello', 10)), -7), bin(bitSlice(toFixedString('Hello', 10), -7));
select -8, subString(bin(toFixedString('Hello', 10)), -8), bin(bitSlice(toFixedString('Hello', 10), -8));
select -9, subString(bin(toFixedString('Hello', 10)), -9), bin(bitSlice(toFixedString('Hello', 10), -9));
select -10, subString(bin(toFixedString('Hello', 10)), -10), bin(bitSlice(toFixedString('Hello', 10), -10));
select -11, subString(bin(toFixedString('Hello', 10)), -11), bin(bitSlice(toFixedString('Hello', 10), -11));
select -12, subString(bin(toFixedString('Hello', 10)), -12), bin(bitSlice(toFixedString('Hello', 10), -12));
select -13, subString(bin(toFixedString('Hello', 10)), -13), bin(bitSlice(toFixedString('Hello', 10), -13));
select -14, subString(bin(toFixedString('Hello', 10)), -14), bin(bitSlice(toFixedString('Hello', 10), -14));
select -15, subString(bin(toFixedString('Hello', 10)), -15), bin(bitSlice(toFixedString('Hello', 10), -15));
select -16, subString(bin(toFixedString('Hello', 10)), -16), bin(bitSlice(toFixedString('Hello', 10), -16));


SELECT 'Const Offset, Const Length';
select 1, 1, subString(bin(toFixedString('Hello', 10)), 1, 1), bin(bitSlice(toFixedString('Hello', 10), 1, 1));
select 2, 2, subString(bin(toFixedString('Hello', 10)), 2, 2), bin(bitSlice(toFixedString('Hello', 10), 2, 2));
select 3, 3, subString(bin(toFixedString('Hello', 10)), 3, 3), bin(bitSlice(toFixedString('Hello', 10), 3, 3));
select 4, 4, subString(bin(toFixedString('Hello', 10)), 4, 4), bin(bitSlice(toFixedString('Hello', 10), 4, 4));
select 5, 5, subString(bin(toFixedString('Hello', 10)), 5, 5), bin(bitSlice(toFixedString('Hello', 10), 5, 5));
select 6, 6, subString(bin(toFixedString('Hello', 10)), 6, 6), bin(bitSlice(toFixedString('Hello', 10), 6, 6));
select 7, 7, subString(bin(toFixedString('Hello', 10)), 7, 7), bin(bitSlice(toFixedString('Hello', 10), 7, 7));
select 8, 8, subString(bin(toFixedString('Hello', 10)), 8, 8), bin(bitSlice(toFixedString('Hello', 10), 8, 8));
select 9, 9, subString(bin(toFixedString('Hello', 10)), 9, 9), bin(bitSlice(toFixedString('Hello', 10), 9, 9));
select 10, 10, subString(bin(toFixedString('Hello', 10)), 10, 10), bin(bitSlice(toFixedString('Hello', 10), 10, 10));
select 11, 11, subString(bin(toFixedString('Hello', 10)), 11, 11), bin(bitSlice(toFixedString('Hello', 10), 11, 11));
select 12, 12, subString(bin(toFixedString('Hello', 10)), 12, 12), bin(bitSlice(toFixedString('Hello', 10), 12, 12));
select 13, 13, subString(bin(toFixedString('Hello', 10)), 13, 13), bin(bitSlice(toFixedString('Hello', 10), 13, 13));
select 14, 14, subString(bin(toFixedString('Hello', 10)), 14, 14), bin(bitSlice(toFixedString('Hello', 10), 14, 14));
select 15, 15, subString(bin(toFixedString('Hello', 10)), 15, 15), bin(bitSlice(toFixedString('Hello', 10), 15, 15));
select 16, 16, subString(bin(toFixedString('Hello', 10)), 16, 16), bin(bitSlice(toFixedString('Hello', 10), 16, 16));

select 1, -1, subString(bin(toFixedString('Hello', 10)), 1, -1), bin(bitSlice(toFixedString('Hello', 10), 1, -1));
select 2, -2, subString(bin(toFixedString('Hello', 10)), 2, -2), bin(bitSlice(toFixedString('Hello', 10), 2, -2));
select 3, -3, subString(bin(toFixedString('Hello', 10)), 3, -3), bin(bitSlice(toFixedString('Hello', 10), 3, -3));
select 4, -4, subString(bin(toFixedString('Hello', 10)), 4, -4), bin(bitSlice(toFixedString('Hello', 10), 4, -4));
select 5, -5, subString(bin(toFixedString('Hello', 10)), 5, -5), bin(bitSlice(toFixedString('Hello', 10), 5, -5));
select 6, -6, subString(bin(toFixedString('Hello', 10)), 6, -6), bin(bitSlice(toFixedString('Hello', 10), 6, -6));
select 7, -7, subString(bin(toFixedString('Hello', 10)), 7, -7), bin(bitSlice(toFixedString('Hello', 10), 7, -7));
select 8, -8, subString(bin(toFixedString('Hello', 10)), 8, -8), bin(bitSlice(toFixedString('Hello', 10), 8, -8));
select 9, -9, subString(bin(toFixedString('Hello', 10)), 9, -9), bin(bitSlice(toFixedString('Hello', 10), 9, -9));
select 10, -10, subString(bin(toFixedString('Hello', 10)), 10, -10), bin(bitSlice(toFixedString('Hello', 10), 10, -10));
select 11, -11, subString(bin(toFixedString('Hello', 10)), 11, -11), bin(bitSlice(toFixedString('Hello', 10), 11, -11));
select 12, -12, subString(bin(toFixedString('Hello', 10)), 12, -12), bin(bitSlice(toFixedString('Hello', 10), 12, -12));
select 13, -13, subString(bin(toFixedString('Hello', 10)), 13, -13), bin(bitSlice(toFixedString('Hello', 10), 13, -13));
select 14, -14, subString(bin(toFixedString('Hello', 10)), 14, -14), bin(bitSlice(toFixedString('Hello', 10), 14, -14));
select 15, -15, subString(bin(toFixedString('Hello', 10)), 15, -15), bin(bitSlice(toFixedString('Hello', 10), 15, -15));
select 16, -16, subString(bin(toFixedString('Hello', 10)), 16, -16), bin(bitSlice(toFixedString('Hello', 10), 16, -16));

select -1, 1, subString(bin(toFixedString('Hello', 10)), -1, 1), bin(bitSlice(toFixedString('Hello', 10), -1, 1));
select -2, 2, subString(bin(toFixedString('Hello', 10)), -2, 2), bin(bitSlice(toFixedString('Hello', 10), -2, 2));
select -3, 3, subString(bin(toFixedString('Hello', 10)), -3, 3), bin(bitSlice(toFixedString('Hello', 10), -3, 3));
select -4, 4, subString(bin(toFixedString('Hello', 10)), -4, 4), bin(bitSlice(toFixedString('Hello', 10), -4, 4));
select -5, 5, subString(bin(toFixedString('Hello', 10)), -5, 5), bin(bitSlice(toFixedString('Hello', 10), -5, 5));
select -6, 6, subString(bin(toFixedString('Hello', 10)), -6, 6), bin(bitSlice(toFixedString('Hello', 10), -6, 6));
select -7, 7, subString(bin(toFixedString('Hello', 10)), -7, 7), bin(bitSlice(toFixedString('Hello', 10), -7, 7));
select -8, 8, subString(bin(toFixedString('Hello', 10)), -8, 8), bin(bitSlice(toFixedString('Hello', 10), -8, 8));
select -9, 9, subString(bin(toFixedString('Hello', 10)), -9, 9), bin(bitSlice(toFixedString('Hello', 10), -9, 9));
select -10, 10, subString(bin(toFixedString('Hello', 10)), -10, 10), bin(bitSlice(toFixedString('Hello', 10), -10, 10));
select -11, 11, subString(bin(toFixedString('Hello', 10)), -11, 11), bin(bitSlice(toFixedString('Hello', 10), -11, 11));
select -12, 12, subString(bin(toFixedString('Hello', 10)), -12, 12), bin(bitSlice(toFixedString('Hello', 10), -12, 12));
select -13, 13, subString(bin(toFixedString('Hello', 10)), -13, 13), bin(bitSlice(toFixedString('Hello', 10), -13, 13));
select -14, 14, subString(bin(toFixedString('Hello', 10)), -14, 14), bin(bitSlice(toFixedString('Hello', 10), -14, 14));
select -15, 15, subString(bin(toFixedString('Hello', 10)), -15, 15), bin(bitSlice(toFixedString('Hello', 10), -15, 15));
select -16, 16, subString(bin(toFixedString('Hello', 10)), -16, 16), bin(bitSlice(toFixedString('Hello', 10), -16, 16));

select -1, -16, subString(bin(toFixedString('Hello', 10)), -1, -16), bin(bitSlice(toFixedString('Hello', 10), -1, -16));
select -2, -15, subString(bin(toFixedString('Hello', 10)), -2, -15), bin(bitSlice(toFixedString('Hello', 10), -2, -15));
select -3, -14, subString(bin(toFixedString('Hello', 10)), -3, -14), bin(bitSlice(toFixedString('Hello', 10), -3, -14));
select -4, -13, subString(bin(toFixedString('Hello', 10)), -4, -13), bin(bitSlice(toFixedString('Hello', 10), -4, -13));
select -5, -12, subString(bin(toFixedString('Hello', 10)), -5, -12), bin(bitSlice(toFixedString('Hello', 10), -5, -12));
select -6, -11, subString(bin(toFixedString('Hello', 10)), -6, -11), bin(bitSlice(toFixedString('Hello', 10), -6, -11));
select -7, -10, subString(bin(toFixedString('Hello', 10)), -7, -10), bin(bitSlice(toFixedString('Hello', 10), -7, -10));
select -8, -9, subString(bin(toFixedString('Hello', 10)), -8, -9), bin(bitSlice(toFixedString('Hello', 10), -8, -9));
select -9, -8, subString(bin(toFixedString('Hello', 10)), -9, -8), bin(bitSlice(toFixedString('Hello', 10), -9, -8));
select -10, -7, subString(bin(toFixedString('Hello', 10)), -10, -7), bin(bitSlice(toFixedString('Hello', 10), -10, -7));
select -11, -6, subString(bin(toFixedString('Hello', 10)), -11, -6), bin(bitSlice(toFixedString('Hello', 10), -11, -6));
select -12, -5, subString(bin(toFixedString('Hello', 10)), -12, -5), bin(bitSlice(toFixedString('Hello', 10), -12, -5));
select -13, -4, subString(bin(toFixedString('Hello', 10)), -13, -4), bin(bitSlice(toFixedString('Hello', 10), -13, -4));
select -14, -3, subString(bin(toFixedString('Hello', 10)), -14, -3), bin(bitSlice(toFixedString('Hello', 10), -14, -3));
select -15, -2, subString(bin(toFixedString('Hello', 10)), -15, -2), bin(bitSlice(toFixedString('Hello', 10), -15, -2));
select -16, -1, subString(bin(toFixedString('Hello', 10)), -16, -1), bin(bitSlice(toFixedString('Hello', 10), -16, -1));

select 'Dynamic Offset, Dynamic Length';

select number, number, subString(bin(toFixedString('Hello', 10)), number, number), bin(bitSlice(toFixedString('Hello', 10), number, number)) from numbers(16);
select number, -number, subString(bin(toFixedString('Hello', 10)), number, -number), bin(bitSlice(toFixedString('Hello', 10), number, -number)) from numbers(16);
select -number, -16+number, subString(bin(toFixedString('Hello', 10)), -number, -16+number), bin(bitSlice(toFixedString('Hello', 10), -number, -16+number)) from numbers(16);
select -number, number, subString(bin(toFixedString('Hello', 10)), -number, number), bin(bitSlice(toFixedString('Hello', 10), -number, number)) from numbers(16);
