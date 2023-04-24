#include <os.h>

static void kmt_init() {

}

MODULE_DEF(kmt) = {
    .init = kmt_init,
};
