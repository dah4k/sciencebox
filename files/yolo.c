// Copyright 2025 dah4k
// SPDX-License-Identifier: MIT-0

#include <unistd.h>

int main(int argc, char *argv[], char *envp[])
{
    (void)setuid(geteuid());
    execve("/bin/bash", argv, envp);
    return 0;
}

