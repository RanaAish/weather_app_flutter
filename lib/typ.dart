class test <T>
{
  void printany(T a)
  {
    print(a);
  }

}
class Apple
{
  @override
  String toString() {
    return "apple";
  }
}
class Oriea
{
  @override
  String toString() {
    return "ore";
  }
}
main()
{
  var  t=test<Apple>();
  var a=Apple();
  t.printany(a);

}
