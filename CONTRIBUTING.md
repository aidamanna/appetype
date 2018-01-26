# Contributing to Appetype

If you discover issues, have ideas for improvements or new features, please report them to the issue tracker of the repository or submit a pull request. Please, try to follow these guidelines when you do so.

## Issue reporting

- Ensure the issue has not already been reported by searching on GitHub under [Issues](https://github.com/aidamanna/appetype/issues).
- When opening a new issue, be sure to include a title and clear description, as much relevant information as possible, and a code sample or an executable test case demonstrating the expected behavior that is not occurring.

## Pull requests

- Fork the project.
- Use a feature branch.
- Use the same coding conventions as the rest of the project.
- Make sure to add tests.
- Make sure existing tests are passing and the code you wrote doesn't produce RuboCop offenses.
- Open a pull request that relates to only one subject with a clear title and description (describe the problem and the solution).
- Include the relevant issue number if applicable.

## Coding conventions

### Views

- Avoid putting logic in views.

### Controllers

- Create single action controllers.
- Controllers should only contain control logic, business logic belongs to the service.
- Group controllers in namespaces.


### Services

- Follow service objects pattern.
- Use instance methods, not class methods.
- Have only one public method, ```call```.
- Do not read params hash inside the service.
- Group services in namespaces.
- Service methods will raise an error when the action(s) cannot be completed. The exception will be handled by the controller. If no exception is raised we assume everything went fine.
- Create custom exceptions.

### Queries

- Place complex / longer queries in query objects.
