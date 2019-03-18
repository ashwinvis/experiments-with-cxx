// g++ -std=c++14 main.cpp
#include <cstdio>
#include <typeinfo>

auto incr = [=](int &a) {++a;};

auto typeof = [=](auto var) {
  return typeid(var).name();
};

int main() {
  int a=2;

  printf("Value of a initially: %d\n", a);
  incr(a);
  printf("Type of a: %s\n", typeof(a));
  printf("Type of lambda incr: %s\n", typeof(incr));
  printf("Value of a after increment: %d\n", a);
  return 0;
}
