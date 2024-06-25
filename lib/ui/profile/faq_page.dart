import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
          title: Text(
            'FAQ',
            style: Theme.of(context).textTheme.headlineMedium?.apply(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'Why do I need a conveyancer to transfer property?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "Only a conveyancer can transfer property according to the laws of Botswana."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'When I buy a BHC property; Do your lawyers process transfer and bonding of this property?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "No. The purchaser has to engage a conveyancer for the transfer and bonding of a property."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'I am not a citizen of Botswana, am I eligible to buy a BHC house?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "Only citizens and citizen-controlled companies are eligible to purchase BHC    properties. (Citizens controlled companies refer to those with a majority shareholders being Botswana citizens)."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'How many houses can my company be allowed to buy?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "A company can buy one or more houses from BHC depending on availability."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'Can I sell the property I am renting from BHC?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "BHC alone has the right to sell its properties."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'Since I am only allowed to buy one house from BHC, can my husband buy a house as well?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "Married couples can only buy one house from BHC, however in some cases a sale to a spouse can be considered. Refer to question (Can I buy more than one property from BHC?)."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'Can I buy more than one property from BHC?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "An individual or married couple are allowed to buy one house from BHC country wide. Applicants who have already purchased property from BHC, spouse jointly counted, shall only be considered where there would be no offers from first time buyers.."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'Does BHC maintain my house after I have purchased it?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "BHC only maintains structural defects for active TPS/SOS sales as per the sale agreement otherwise the customer maintains all other defects. For outright sale arrangement, the owner is liable for maintenance costs."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    "Am I allowed to make alterations/fittings to the house I've bought?",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "If you have bought outright, you can make alterations without consulting BHC, however if you have bought through TPS/SOS you have to seek permission in writing from BHC. In both cases the customer has to satisfy council bye-laws on any improvements proposed."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    "Can I lease out my BHC house while it's still on TPS/SOS?",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "Yes, you are allowed to lease out your TPS/SOS house, however the purchaser remains responsible for the obligations of the sale agreement."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'Where can I inquire about my TPS/SOS balance?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "You can get TPS/SOS statement from any BHC credit control office."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'Does BHC have mortgage protection cover for the death of the TPS/SOS Purchasers?',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "No. The Purchaser has to make his/her own arrangement through life cover policies available in the market."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'For those who purchased houses before the introduction of VAT, how does it affect them? ',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "Value Added Tax is a Government tax. It affects Purchasers who bought houses through TPS/SOS before the tax was introduced because the administration fees attract VAT. The VAT increased the instalments."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    'Why do I have to pay penalties at Deeds Registry for my TPS/SOS property? ',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "Section 6 of the Transfer Duty Act prescribes that such a duty is payable six (6) months from the date of sale of land. It further stipulates that if the duty is not paid within the prescribed time then a penalty shall be levied on the outstanding amount at the rate of 12% per annum. It is important to note however that both the Deeds Registry Act and the Transfer Duty Act are not being administered by BHC."),
                ),
                const Divider(),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    expandIcon: Icons.arrow_drop_down,
                    collapseIcon: Icons.arrow_drop_up,
                    iconColor: Colors.grey,
                    iconSize: 20.0,
                    iconRotationAngle: 3.14 / 2,
                    iconPadding: EdgeInsets.only(right: 5),
                    hasIcon: true,
                  ),
                  header: Text(
                    "Why do I have to pay rates when I'm purchasing under TPS/SOS while BHC still holds the title?",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: Colors.black,
                        ),
                  ),
                  collapsed: Container(),
                  expanded: const Text(
                      "Purchasers pay rates as per their obligation in the sale agreements they entered into with BHC. Also, the Township Act qualifies the Purchasers to pay rates as \"owners\" because of the sale arrangement."),
                ),
                const Divider(),
                ExpandablePanel(
                    theme: const ExpandableThemeData(
                      expandIcon: Icons.arrow_drop_down,
                      collapseIcon: Icons.arrow_drop_up,
                      iconColor: Colors.grey,
                      iconSize: 20.0,
                      iconRotationAngle: 3.14 / 2,
                      iconPadding: EdgeInsets.only(right: 5),
                      hasIcon: true,
                    ),
                    header: Expanded(
                      child: Text(
                        'I have been paying the required monthly instalments, but my balance does not decrease significantly, why?',
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge?.apply(
                              color: Colors.black,
                            ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("This happens because;"),
                        Text(
                            "* The longer the contract period, the smaller the instalment, hence the greater the interest charge, and the less the balance reduction, that is, the greater part of the payments goes to interest."),
                        Text(
                            "*   In case of SOS, rental increase has an effect."),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
