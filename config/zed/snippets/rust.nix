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
  };
}
