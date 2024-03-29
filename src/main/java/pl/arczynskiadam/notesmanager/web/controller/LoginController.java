package pl.arczynskiadam.notesmanager.web.controller;

import static pl.arczynskiadam.notesmanager.web.controller.constants.GlobalControllerConstants.Misc.HASH;
import static pl.arczynskiadam.notesmanager.web.controller.constants.GlobalControllerConstants.Prefixes.REDIRECT_PREFIX;
import static pl.arczynskiadam.notesmanager.web.controller.constants.LoginControllerConstants.ModelAttrKeys.Form.LOGIN_FORM;
import static pl.arczynskiadam.notesmanager.web.controller.constants.LoginControllerConstants.Pages.LOGIN_PAGE;
import static pl.arczynskiadam.notesmanager.web.controller.constants.NoteControllerConstants.URLs.SHOW_NOTES_FULL;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pl.arczynskiadam.notesmanager.web.controller.constants.LoginControllerConstants;
import pl.arczynskiadam.notesmanager.web.form.LoginForm;
import pl.arczynskiadam.notesmanager.web.messages.GlobalMessages;
import pl.arczynskiadam.notesmanager.web.tag.navigation.BreadcrumbsItem;

@Controller
public class LoginController extends AbstractController {
	
	@RequestMapping(value = LoginControllerConstants.URLs.LOGIN, method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@ModelAttribute(LOGIN_FORM) LoginForm loginForm,
			Model model) {

		if (isUserLoggedIn()) {
			return REDIRECT_PREFIX + SHOW_NOTES_FULL;
		}
		
		if (error != null) {
			GlobalMessages.addErrorMessage("login.failed", model);
		}

		addDefaultBreadcrumbsToModel(model);
		return LOGIN_PAGE;
	}
	
	@RequestMapping(value = LoginControllerConstants.URLs.LOGOUT, method = RequestMethod.GET)
	public String logout(RedirectAttributes attrs) {

		GlobalMessages.addInfoFlashMessage("global.logout.success", attrs);
		GlobalMessages.addInfoFlashMessage("global.continueAsAnonymous", attrs);
		
		return REDIRECT_PREFIX + SHOW_NOTES_FULL;
	}
	
	private void addDefaultBreadcrumbsToModel(Model model) {
		createBreadcrumpAndSaveToModel(model,
				new BreadcrumbsItem(getMessage("breadcrumbs.home"), SHOW_NOTES_FULL),
				new BreadcrumbsItem(getMessage("breadcrumbs.login"), HASH));
	}
}
