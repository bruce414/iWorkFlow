import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'theme_page.dart';
import 'tasks_model/category_list_ui.dart';

class PersonalTasksPage extends StatefulWidget {
  const PersonalTasksPage({Key? key}) : super(key: key);

  @override
  _PersonalTasksPageState createState() => _PersonalTasksPageState();
}

enum allTabs { alltasks, personal, work }

class _PersonalTasksPageState extends State<PersonalTasksPage> {
  TabController? tabController;
  DateTime selectedDate = DateTime.now();

  String appTitle1 = '';
  String appTitle2 = 'Personal';
  String appTitle3 = 'Work';
  String appTitle4 = 'Family';

  final theme1 = IWorkFlowTheme.appTheme1blue();
  final theme2 = IWorkFlowTheme.appTheme2green();

  late final userSelected = true;

  final marginForTasksAddingPanel =
  const EdgeInsets.only(left: 10.0, right: 10.0);
  final sizedBoxForTasksAddingPanel = const SizedBox(height: 30.0);
  final sizedBoxForTasksAddingPanelBetweenEachSection =
  const SizedBox(height: 15.0);

  String? userSelectedCategoryIndex;

  List categoryIndex = [
    'All tasks',
    'Personal',
    'Work',
    'Family',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appTitle2,
            style: IWorkFlowTheme.lightTextTheme.headline1,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: () => showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                isScrollControlled: true,
                isDismissible: true,
                context: context,
                builder: (context) => const OpenCategoryListUI(),
              ),
              icon: const Icon(Icons.sort_outlined),
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(
                child: Text(
                  'Today',
                  style: IWorkFlowTheme.lightTextTheme.headline2,
                ),
              ),
              Tab(
                child: Text(
                  'Tomorrow',
                  style: IWorkFlowTheme.lightTextTheme.headline2,
                ),
              ),
              Tab(
                child: Text(
                  'Upcoming',
                  style: IWorkFlowTheme.lightTextTheme.headline2,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () => showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                isScrollControlled: true,
                isDismissible: true,
                context: context,
                builder: (context) => tasksAddingPanel1(),
              ),
              child: const Icon(
                Icons.add_task_outlined,
              ),
              backgroundColor: Colors.blue,
              elevation: 10.0,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            displayPage(
              'Oops, there\'s nothing here',
            ),
            displayPage(
              'Oops, there\'s nothing here',
            ),
            displayPage(
              'Oops, there\'s nothing here',
            ),
          ],
          //TODO The first way of designing the taskspage is simply by tab bar view, another way is by creating a draw
          //TODO so that the users can navigate between 'Today', 'Tomorrow''s tasks from there; Slide the screen over to the left to open the drawer,
        ),
      ),
    );
  }

  Widget displayPage(String text) => Center(
    child: Text(text, style: IWorkFlowTheme.lightTextTheme.headline4,),
  );

  Widget tasksAddingPanel1() => DraggableScrollableSheet(
    expand: false,
    initialChildSize: 0.90,
    maxChildSize: 0.90,
    minChildSize: 0.90,
    builder: (context, scrollController) => Container(
      padding: const EdgeInsets.all(16.0),
      child: Stack(children: [
        ListView(
          controller: scrollController,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: const Text(
                'Add task',
                style: TextStyle(
                  fontSize: 23.0,
                ),
              ),
            ),
            sizedBoxForTasksAddingPanel,
            Container(
              margin: marginForTasksAddingPanel,
              child: const Text(
                'Title',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            sizedBoxForTasksAddingPanelBetweenEachSection,
            Container(
              margin: marginForTasksAddingPanel,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the name of the task',
                ),
              ),
            ),
            sizedBoxForTasksAddingPanel,
            Container(
              margin: marginForTasksAddingPanel,
              child: const Text(
                'Pick a date',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            sizedBoxForTasksAddingPanelBetweenEachSection,
            Container(
              margin: marginForTasksAddingPanel,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  SizedBox(
                    width: 150.0,
                    child: GestureDetector(
                      onTap: () => _selectedDate(context),
                      child: Card(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const ListTile(
                          title: Center(
                            child: Text(
                              'select date',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxForTasksAddingPanel,
            Container(
              margin: marginForTasksAddingPanel,
              child: const Text(
                'Label it',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            sizedBoxForTasksAddingPanelBetweenEachSection,
            Container(
              margin: marginForTasksAddingPanel,
              child: GestureDetector(
                onTap: () => showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    title: const Text(
                      'Pick a category',
                    ),
                    content: Column(
                      children: const [
                        Text('Personal'),
                      ],
                    ),
                  ),
                ),
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const ListTile(
                    title: Center(
                      child: Text(
                        'Personal',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_downward_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            sizedBoxForTasksAddingPanel,
            Container(
              margin: marginForTasksAddingPanel,
              child: const Text(
                'Set a reminder',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            sizedBoxForTasksAddingPanelBetweenEachSection,
            Container(
              margin: marginForTasksAddingPanel,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  SizedBox(
                    width: 150.0,
                    child: GestureDetector(
                      onTap: () => showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.0),
                          ),
                        ),
                        context: context,
                        builder: (context) => CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.dateAndTime,
                          initialDateTime: selectedDate,
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() {
                              selectedDate = newDate;
                            });
                          },
                        ),
                      ),
                      child: Card(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const ListTile(
                          title: Center(
                            child: Icon(
                              Icons.alarm_add_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              margin: marginForTasksAddingPanel,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 2,
                    indent: 20.0,
                    endIndent: 0.0,
                    width: 10.0,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    ),
  );

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }



}