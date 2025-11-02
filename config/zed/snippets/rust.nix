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
  };
}
