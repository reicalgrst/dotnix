{ config, pkgs, ... }:

{
  home.file.".config/zed/snippets/rust.json".text = builtins.toJSON {
    "Rolling Hash" = {
      prefix = "rolling hash";
      body = [
        "struct RollingHash {"
        "    pow: Vec<u128>,"
        "    hash: Vec<u128>,"
        "}"
        ""
        "impl RollingHash {"
        "    const MOD: u128 = (1 << 61) - 1;"
        "    const BASE: u128 = (1 << 31) - 1;"
        ""
        "    fn new(s: &String) -> Self {"
        "        let n = s.len();"
        "        let mut pow = vec![1; n + 1];"
        "        let mut hash = vec![0; n + 1];"
        ""
        "        for (i, c) in s.chars().enumerate() {"
        "            pow[i + 1] = pow[i] * Self::BASE % Self::MOD;"
        "            hash[i + 1] = (hash[i] * Self::BASE + c as u128) % Self::MOD;"
        "        }"
        ""
        "        Self { pow, hash }"
        "    }"
        ""
        "    fn get(&self, l: usize, r: usize) -> u128 {"
        "        (self.hash[r] + Self::MOD - self.hash[l] * self.pow[r - l] % Self::MOD) % Self::MOD"
        "    }"
        "}"
      ];
      description = "Rolling hash implementation for string hashing";
    };

    "Base Convert" = {
      prefix = "base";
      body = [
        "fn base_x_to_base_y(mut N: String, X: u128, Y: u128) -> String {"
        "    let mut n = 0;"
        "    let mut i = 0;"
        "    while let Some(c) = N.pop() {"
        "        n += (c as u8 - b'0') as u128 * X.pow(i);"
        "        i += 1;"
        "    }"
        ""
        "    if n == 0 {"
        "        return \"0\".to_string();"
        "    }"
        ""
        "    let mut res = String::new();"
        "    while 0 < n {"
        "        let m = (n % Y) as u8 + b'0';"
        "        res.push(m as char);"
        "        n /= Y;"
        "    }"
        ""
        "    let res = res.chars().rev().collect();"
        "    res"
        "}"
      ];
      description = "Base Conversion From Base X to Base Y";
    };

    "Prime factorize and Divisor" = {
      prefix = "pfs";
      body = [
        "trait Integer {"
        "    fn divs(&self) -> Vec<usize>;"
        "    fn pfs(&self) -> Vec<usize>;"
        "}"
        ""
        "impl Integer for usize {"
        "    fn divs(&self) -> Vec<usize> {"
        "        let mut res = Vec::new();"
        "        let n = *self;"
        "        for i in (1..).take_while(|&x| x * x <= n) {"
        "            if n % i == 0 {"
        "                res.push(i);"
        "                if i != n / i {"
        "                    res.push(n / i);"
        "                }"
        "            }"
        "        }"
        "        res.sort_unstable();"
        "        res"
        "    }"
        ""
        "    fn pfs(&self) -> Vec<usize> {"
        "        let mut res = Vec::new();"
        "        let mut n = *self;"
        "        for i in (2..).take_while(|&x| x * x <= *self) {"
        "            if n % i == 0 {"
        "                res.push(i);"
        "                while n % i == 0 {"
        "                    n /= i;"
        "                }"
        "            }"
        "        }"
        ""
        "        if 1 < n {"
        "            res.push(n);"
        "        }"
        ""
        "        res"
        "    }"
        "}"
      ];
      description = "allow usize for getting its Prime factorize and Divisors";
    };
    "Modulo Combination" = {
      prefix = "comb";
      body = [
        "struct Combination {"
        "    fac: Vec<mint>,"
        "    finv: Vec<mint>,"
        "}"
        ""
        "impl Combination {"
        "    fn new(N: usize) -> Self {"
        "        let MOD = mint::modulus() as usize;"
        "        let mut fac = vec![mint::new(1); N + 1];"
        "        let mut finv = vec![mint::new(1); N + 1];"
        "        let mut inv = vec![mint::new(1); N + 1];"
        ""
        "        for i in 2..=N {"
        "            fac[i] = fac[i - 1] * i;"
        "            inv[i] = mint::new(MOD) - inv[MOD % i] * (MOD / i);"
        "            finv[i] = finv[i - 1] * inv[i];"
        "        }"
        "        Self { fac, finv }"
        "    }"
        ""
        "    fn com(&self, N: usize, K: usize) -> mint {"
        "        if N < K {"
        "            mint::new(0)"
        "        } else {"
        "            self.fac[N] * self.finv[K] * self.finv[N - K]"
        "        }"
        "    }"
        "}"
      ];
      description = "provoide modint combination for preprocess O(N) and calc O(1)";
    };
  };
}
