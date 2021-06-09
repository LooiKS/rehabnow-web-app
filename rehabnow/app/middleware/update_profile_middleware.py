from django.shortcuts import redirect


def update_profile_middleware(get_response):
    # One-time configuration and initialization.

    def middleware(request):
        # Code to be executed for each request before
        # the view (and later middleware) are called.

        response = get_response(request)

        if not request.user.first_name and request.path.find("edit-profile") == -1:
            return redirect("edit-profile")

        # Code to be executed for each request/response after
        # the view is called.

        return response

    return middleware