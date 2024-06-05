The entry point for your Shell implementation is in `src/main.cpp`.

Study and uncomment the relevant code: 

```cpp
// Uncomment this block to pass the first stage
std::cout << "$ ";
std::cout.flush();

std::string input;
std::getline(std::cin, input);
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
