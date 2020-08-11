var tag55 =  getStringField(55);
var tag600 = "C5TC OCT20";
print (tag55);
print (tag600);
regexp55 = /\s[PC]\d+/g;
tag55_tail = regexp55.exec(tag55);
if (tag55_tail != null)
{
    tag600 = tag600 + tag55_tail;
}
print (tag600);